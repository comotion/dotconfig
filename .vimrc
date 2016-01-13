execute pathogen#infect()
set mouse=a
set ts=2 sw=2 ai si
set background=dark

au BufRead,BufNewFile *.vcl :set ft=vcl
au! Syntax vcl source ~/.vim/syntax/vcl.vim
"syntax on
"filetype plugin indent on
" auto bufenter * :set title | let &titlestring=system("cd $(dirname \"" . expand("%") . "\") && git rev-parse --show-toplevel | tr -d \"\n\" >/dev/null 2>/dev/null") . " " . expand("%:t")
"
