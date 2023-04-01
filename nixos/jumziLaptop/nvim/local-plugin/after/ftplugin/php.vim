if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

augroup sh
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

