if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

setlocal tabstop=2 sts=2 sw=2 expandtab
call neomake#configure#automake('rw')

augroup yaml
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END
