-module(user_default).

-export([help/0]).
-export([mm/0]).
-export([re/0, re/1]).
-export([make/0, make/1]).

help() ->
	shell_default:help(),
	io:format("** user commands **~n"),
	io:format("mm()        -- Find modified modules\n"),
	io:format("re()        -- Reload all modules under current dir\n"),
	io:format("re(Dir)     -- Reload all modules under dir\n"),
	io:format("make()      -- Same as make(false).\n"),
	io:format("make(true)  -- Call make and and reload everything, clear shell\n"),
	io:format("make(false) -- Call make and and reload everything, clear shell\n").

mm() -> modified_modules().

re() ->
 	{ok, Cwd} = file:get_cwd(),
	reload(Cwd).
re(Dir) -> reload(Dir).

make() -> make(false).
make(true)  -> io:format("make:~n=====~s~n~n", [os:cmd(make)]), re(), shell_default:f();
make(false) -> io:format("make:~n=====~s~n~n", [os:cmd(make)]), re(), shell_default:f().

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
