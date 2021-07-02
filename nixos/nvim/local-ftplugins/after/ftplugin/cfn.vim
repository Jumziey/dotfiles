setlocal tabstop=2 sts=2 sw=2 expandtab

call neomake#configure#automake('rw')

augroup cfn
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END
