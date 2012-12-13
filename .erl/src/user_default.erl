-module(user_default).

-export([help/0]).
-export([mm/0]).
-export([re/0, re/1]).
-export([make/0, make/1]).
-export([tc_call/3, tc_call/4]).

help() ->
	shell_default:help(),
	io:format("** user commands **~n"),
	io:format("mm()        -- Find modified modules\n"),
	io:format("re()        -- Reload all modules under current dir\n"),
	io:format("re(Dir)     -- Reload all modules under dir\n"),
	io:format("make()      -- Same as make(false).\n"),
	io:format("make(true)  -- Call make and and reload everything, clear shell\n"),
	io:format("make(false) -- Call make and and reload everything, clear shell\n"),
	io:format("** benchmarking **~n"),
	io:format("tc_call(fun */*, A:[], N::0..) -- call a fun N times with args A\n"),
	io:format("tc_call(M, F, A::[], N::0..) -- call a fun N times with args A\n").

mm() -> modified_modules().

re() ->
 	{ok, Cwd} = file:get_cwd(),
	reload(Cwd).
re(Dir) -> reload(Dir).

make() -> make(false).
make(true)  -> io:format("make:~n=====~s~n~n", [os:cmd(make)]), re();
make(false) -> io:format("make:~n=====~s~n~n", [os:cmd(make)]), re().

tc_call(M, F, A, N) -> Arity = length(A), tc_call(fun M:F/Arity, A, N).
tc_call(Fun, A, N) when is_function(Fun, length(A)) -> calc_avg(test_loop(Fun, A, N, [])).

modified_modules() ->
  [M || {M, _} <-  code:all_loaded(), module_modified(M) == true].

reload(Dir) ->
	[{code:purge(M), code:soft_purge(M), code:load_file(M)} || {M, P}
		<- code:all_loaded(), is_list(P), 0 =/= string:str(P, Dir)].

module_modified(Module) ->
	case code:is_loaded(Module) of
		{file, preloaded} -> false;
		{file, Path} ->
			CompileOpts = proplists:get_value(compile, Module:module_info()),
			CompileTime = proplists:get_value(time, CompileOpts),
			Src = proplists:get_value(source, CompileOpts),
			module_modified(Path, CompileTime, Src);
		_ -> false
	end.

module_modified(Path, PrevCompileTime, PrevSrc) ->
  case find_module_file(Path) of
	false -> false;
	ModPath ->
		{ok, {_, [{_, CB}]}} = beam_lib:chunks(ModPath, ["CInf"]),
		CompileOpts =  binary_to_term(CB),
		CompileTime = proplists:get_value(time, CompileOpts),
		Src = proplists:get_value(source, CompileOpts),
		not (CompileTime == PrevCompileTime) and (Src == PrevSrc)
	end.

find_module_file(Path) ->
	case file:read_file_info(Path) of
		{ok, _} -> Path;
		_ -> case code:where_is_file(filename:basename(Path)) of
			non_existing -> false;
			NewPath -> NewPath
		end
	end.

calc_avg(L) ->
    Length = length(L),
    Min = lists:min(L),
    Max = lists:max(L),
    Med = lists:nth(round((Length / 2)), lists:sort(L)),
    Avg = round(lists:foldl(fun(X, Sum) -> X + Sum end, 0, L) / Length),
    io:format("Range: ~b - ~b mics~n"
	      "Median: ~b mics~n"
	      "Average: ~b mics~n",
	      [Min, Max, Med, Avg]),
    Med.

test_loop(_,_, 0, List) -> List;
test_loop(Fun, A, N, List) ->
	{T, _Result} = timer:tc(Fun, A),
	test_loop(Fun, A, N -1, [T|List]).
