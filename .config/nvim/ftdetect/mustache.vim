function! SetMustache()
	if expand('%:p') =~ "/Users/lieuwe/Desktop/simply/simplyHomework"
		setlocal filetype=mustache
	endif
endfunction
augroup MustacheOpen
	autocmd!
	autocmd FileType html :call SetMustache()
augroup END

au BufRead,BufNewFile *.hbs set filetype=mustache
