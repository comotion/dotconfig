" Aaaaaaahhhh colors
colorscheme elflord
set background=dark

" Keep buffers
set hidden

" Set line numbers
set number

" tab size
set tabstop=4
set shiftwidth=4
set hlsearch 

" Automatically refresh vim config changes
autocmd! bufwritepost vimrc source ~/.vimrc

" Fix  tabbing
set wildmenu
set wildmode=list:longest

" Fix case-insensitive search unless you have a capital letter
set ignorecase
set smartcase
" And highlighting, also when they are typed
set hlsearch
set incsearch

" Set the title for your terminal
set title

" When we scroll, make it a few lines more so we know what we do
set scrolloff=3

set backspace=indent,eol,start

filetype on
filetype plugin on

" Fix .tpl files
au BufRead,BufNewFile *.tpl set filetype=xml
