" Moves lines using Alt-Shift-[up|down]
nmap <M-S-Down>      mz:m+<cr>`z
nmap <M-S-Up>        mz:m-2<cr>`z
vmap <M-S-Down>      :m'>+<cr>`<my`>mzgv`yo`<
vmap <M-S-Up>        :m'<-2<cr> `>my`<mzgv`yo`z
imap <M-S-Up>        <Esc>:m-2<cr>`z<Esc>i
imap <M-S-Down>      <Esc>:m+<cr>`z <Esc>i

nmap <C-S-Down>	  yyp<CR> 
nmap <C-S-Up>       yyP<CR>

" Make me tabs and open/close things
map  tc            :tabclose<CR>
"imap tc            <Esc>:q<CR>
map  <C-t>         :tabnew<CR>
imap <C-t>         <Esc>:tabnew<CR>
map  <M-S-Left>    :tabprevious<CR>
imap <M-S-Left>    <Esc>:tabprevious<CR>
map  <M-S-Right>   :tabnext<CR>
imap <M-S-Right>   <Esc>:tabnext<CR>


