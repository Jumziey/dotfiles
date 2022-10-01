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
  },
  sources = {
		-- Dependendent on lspconfig.lua
    { name = 'nvim_lsp' },
  },
}
