let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1 " especially with this one
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
set updatetime=1000

map <F8> :!/usr/bin/ctags -R .<CR>
map <F7> :Tlist<CR>
