" Keep buffers
set hidden

" Set line numbers
" set number
set foldcolumn=1

" tab size
set tabstop=3
set shiftwidth=3
set hlsearch
set copyindent

set nobackup
set noswapfile

" Automatically refresh vim config changes
autocmd! bufwritepost vimrc source ~/.vimrc
autocmd! bufwritepost *.ex :Mcompile

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

" Erlang
au BufNewFile,BufRead rebar.config,reltool.config,*.app.src set filetype=erlang

" We would never need to highlight lines that's longer than 120 since
" they are usually just minifed css/js
set synmaxcol=120

" Autocompleted buffer selection (Thanks to Agathoklis D.  Hatzimanikas)
" http://vim.1045645.n5.nabble.com/Sort-the-buffer-list-td1184351.html
function! BufNames(A, L, P)
    redir => bufnames
    silent ls
    redir END
    let list = []
    for name in split(bufnames, "\n")
        let buf = fnamemodify(split(name, '"')[-2], ":t")
        if match(buf, "No Name") == -1
            call add(list, buf)
        endif
    endfor
    return filter(sort(list), 'v:val =~ "^".a:A')
endfunction

command! -nargs=1 -complete=customlist,BufNames Gb exec "buffer "<q-args>

" Sort output of ls (Thanks to Christian Brabandt)
" http://vim.1045645.n5.nabble.com/Sort-the-buffer-list-td1184351.html
fu! BufSortedLs()
    redir => bufnames
    silent ls
    redir END
    let list = []
    let list = split(bufnames, "\n")
    echo "\n" . join(sort(list, "BufSort"), "\n")
endfunction

fu! BufSort(...)
   let dict={}
   for name in a:000
       let dict[name]=fnamemodify(split(name, '"')[-2], ":t")
   endfor
   return dict[a:1] == dict[a:2] ? 0 : dict[a:1] > dict[a:2] ? 1 : -1
endfunc

command! -nargs=0 Ls :call BufSortedLs()
