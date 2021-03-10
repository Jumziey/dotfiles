setlocal tabstop=2 sts=2 sw=2 expandtab

augroup cfn
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END
