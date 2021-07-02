set ft=bzl

augroup bazel
  autocmd!
	" Auto formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

