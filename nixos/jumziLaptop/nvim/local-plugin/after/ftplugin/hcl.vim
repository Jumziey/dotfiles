if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

augroup terraform
  autocmd!
	" Auto Formatting
	"
	autocmd BufWritePre * lua vim.lsp.buf.format({async=false})
augroup END
