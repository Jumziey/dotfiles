call neomake#configure#automake('rw')

augroup cfn
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END
