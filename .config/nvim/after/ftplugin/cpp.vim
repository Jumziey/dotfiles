set ts=4 sw=4 ai
set expandtab
map <buffer> <F12> :A<CR>

augroup cpp
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
	" QT syntax
	autocmd BufEnter,BufWritePost * runtime expand('syntax/qt.vim')
augroup END
