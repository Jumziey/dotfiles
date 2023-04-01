if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

let g:neomake_proto_enabled_makers = ['buf']
call neomake#configure#automake('rw')

augroup proto
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

