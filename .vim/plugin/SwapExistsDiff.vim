" original: https://github.com/godlygeek/vim-files

function! s:HandleRecover()
	if !v:shell_error
		echohl WarningMsg
		echomsg "No differences; deleting the old swap file."
		echohl NONE
		call delete(b:swapname)
	endif
endfunction

autocmd SwapExists  * let b:swapchoice = '?' | let b:swapname = v:swapname
autocmd BufReadPost * let b:swapchoice_likely = (&l:ro ? 'o' : 'r')
autocmd BufEnter    * let b:swapchoice_likely = (&l:ro ? 'o' : 'e')
autocmd BufWinEnter * if exists('b:swapchoice') && exists('b:swapchoice_likely') | let b:swapchoice = b:swapchoice_likely | unlet b:swapchoice_likely | endif
autocmd BufWinEnter * if exists('b:swapchoice') && b:swapchoice == 'r' | call s:HandleRecover() | endif
