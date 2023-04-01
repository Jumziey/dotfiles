if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

set tabstop=2 sw=2 ai
map <F12> :A<CR>

augroup c
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
