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
yaml_lsp.yamlls.setup{
  settings = {
    yaml = {
      ... -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        ... -- other schemas
      },
    },
  }
}

EOF
LspStart
