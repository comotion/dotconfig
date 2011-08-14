" Moves lines using Alt-Shift-[up|down]
nmap <M-Down>      mz:m+<cr>`z
nmap <M-Up>        mz:m-2<cr>`z
vmap <M-Down>      :m'>+<cr>`<my`>mzgv`yo`<
vmap <M-Up>        :m'<-2<cr> `>my`<mzgv`yo`z
imap <M-Up>        <Esc>:m-2<cr>`z<Esc>i
imap <M-Down>      <Esc>:m+<cr>`z <Esc>i

nmap <C-Down>	  yyp<CR> 
nmap <C-Up>       yyP<CR>

" Make me tabs and open/close things
map  tc            :q<CR>
"imap tc            <Esc>:q<CR>
map  <C-t>         :tabnew<CR>
imap <C-t>         <Esc>:tabnew<CR>
map  <M-S-Left>    :tabprevious<CR>
imap <M-S-Left>    <Esc>:tabprevious<CR>
map  <M-S-Right>   :tabnext<CR>
imap <M-S-Right>   <Esc>:tabnext<CR>


