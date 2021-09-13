if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

setlocal tabstop=2 sts=2 sw=2 expandtab

augroup yaml
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END

lua << EOF
local yaml_lsp = require("lspconfig")
yaml_lsp.yamlls.setup{}
EOF
LspStart
