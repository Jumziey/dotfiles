local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	completion = {
    completeopt = 'menu,menuone,noinsert',
	},
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
		-- Dependendent on lspconfig.lua
    { name = 'nvim_lsp' },
  },
}

require('cmp_nvim_lsp').default_capabilities()
