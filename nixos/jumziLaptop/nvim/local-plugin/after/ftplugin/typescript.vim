set expandtab
set tabstop=2
set shiftwidth=2

augroup typescript
  autocmd!
	" Auto Formatting
	"
  autocmd BufWritePre * lua vim.lsp.buf.format({async=true})
	" Auto imports
	"
augroup END
