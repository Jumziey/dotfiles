if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

set expandtab
set tabstop=4
set shiftwidth=4

lua << EOF
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-g>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-w>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local settings = {
		java = {
				format = {
						settings = {
								url = '/home/jumzi/code/eclipse-format.xml',
						},
				},
				completion = { importOrder = {} },
				references = { includeDecompiledSources = false },
				saveActions = { organizeImports = true },
		},
}

require('jdtls').start_or_attach{
  cmd = {
    'jdt-language-server',
    '-data', '/home/jumzi/.cache/jdt-language-server/' .. workspace_dir,
  },
	on_attach = on_attach,
	settings = settings,
}
EOF

augroup java
  autocmd!
	" Auto Formatting
	"
  autocmd BufWritePre * lua vim.lsp.buf.format({async=true})
	" Auto imports
	"
	autocmd BufWritePre * lua require'jdtls'.organize_imports()
augroup END
