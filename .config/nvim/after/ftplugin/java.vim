call neomake#configure#automake('rw')

augroup java
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
