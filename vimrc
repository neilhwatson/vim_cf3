" Minimal vimrc
set smartindent
set autoindent
syntax on
filetype plugin indent on

:helptags ~/.vim/doc/
" enable vim_cf3 plugin abbreviations
let g:EnableCFE3KeywordAbbreviations=1

fun! Getchar()
	let c = getchar()
	if c != 0
		let c = nr2char(c)
	endif
	return c
endfun

fun! Eatchar(pat)
	let c = Getchar()
	return (c =~ a:pat) ? '' : c 
endfun
