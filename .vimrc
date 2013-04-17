" Keep buffers
set hidden

" Set line numbers
" set number
set foldcolumn=1

" tab size
set tabstop=4
set shiftwidth=4
set hlsearch
set copyindent

set nobackup
set noswapfile

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

" highlight matching brackets and so on
set showmatch 

filetype on
filetype plugin on

call pathogen#infect()
call pathogen#helptags()

" Aaaaaaahhhh colors
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
syntax on

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" powerline statusbar
set laststatus=2
let g:Powerline_colorscheme='solarized256'
"let g:Powerline_symbols = 'fancy'

" initiate nerdtree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"let NERDTreeDirArrows=1

set mouse=a

" Restore to previous position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au BufNewFile,BufRead rebar.config,reltool.config,*.app.src set filetype=erlang
