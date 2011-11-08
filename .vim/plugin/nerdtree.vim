autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers if only nerd tree is left
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction 
