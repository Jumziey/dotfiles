set expandtab
set tabstop=2
set shiftwidth=2

augroup typescript
  autocmd!
	" Auto Formatting
	"
	autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 100)
	" Auto imports
	"
augroup END
