colorscheme elflord

" Set line numbers
set number

" tab size
set tabstop=4
set shiftwidth=4
set hlsearch 

" Automatically refresh vim config changes
autocmd! bufwritepost vimrc source ~/.vimrc

filetype on
filetype plugin on

" Fix .tpl files
au BufRead,BufNewFile *.tpl set filetype=xml
