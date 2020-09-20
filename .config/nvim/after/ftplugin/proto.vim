let g:neomake_proto_enabled_makers = ['buf']
call neomake#configure#automake('rw')

augroup proto
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

