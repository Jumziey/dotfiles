
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-i>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-g>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-w>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<C-a>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lua_lsp = require("lspconfig")
lua_lsp.lua_ls.setup {
	on_attach = on_attach,
  cmd = { "lua-language-server" };
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` globalaml
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
			},
    },
  },
}

local tsserver_lsp = require("lspconfig")
tsserver_lsp.tsserver.setup{
	on_attach = on_attach,
}

local terraformls_ls = require("lspconfig")
terraformls_ls.terraformls.setup{
	on_attach = on_attach,
  filetypes = { 'terraform', 'hcl' },
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
}

require'lspconfig'.cmake.setup{
	on_attach = on_attach,
}


require'lspconfig'.graphql.setup{
  on_attach = on_attach,
}

require'lspconfig'.rnix.setup{
  on_attach = on_attach,
}

require'lspconfig'.helm_ls.setup{
  on_attach = on_attach,
}
