if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

set tabstop=4 sw=4 ai
set expandtab
map <buffer> <F12> :A<CR>

augroup cpp
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
	" QT syntax
	autocmd BufEnter,BufWritePost * runtime expand('syntax/qt.vim')
augroup END
