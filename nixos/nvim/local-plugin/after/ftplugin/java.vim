if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

call neomake#configure#automake('rw')

augroup java
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
