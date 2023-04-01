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
    ['<C-n>'] = function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end,
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
		-- Dependendent on lspconfig.lua
    { name = 'nvim_lsp' },
  },
}

require('cmp_nvim_lsp').default_capabilities()
