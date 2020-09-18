set ts=2 sw=2 ai
map <F12> :A<CR>

augroup c
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
