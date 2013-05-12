let erlang_autocompile = 1
let erlang_folding = 1
autocmd BufWritePost *.erl :silent !(cd %:p:h;ctags -R)&
