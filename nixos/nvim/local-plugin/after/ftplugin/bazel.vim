if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

set filetype=bzl

augroup bazel
  autocmd!
	" Auto formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

