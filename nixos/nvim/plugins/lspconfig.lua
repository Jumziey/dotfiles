
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lua_lsp = require("lspconfig")

lua_lsp.sumneko_lua.setup {
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


local yaml_lsp = require("lspconfig")

local cfn_schema = vim.empty_dict()
-- cfn_schema["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.yaml"
-- cfn_schema["https://s3.amazonaws.com/cfn-resource-specifications-us-east-1-prod/schemas/2.15.0/all-spec.json"] = "*.yaml"
-- cfn_schema["https://d3teyb21fexa9r.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json"] = "*.yaml" -- eu-west-1
-- cfn_schema["https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json"] = "*.yaml" -- us-east-1
cfn_schema["https://d3teyb21fexa9r.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json"] = "*.yaml" -- eu-west-1


yaml_lsp.yamlls.setup{
	on_attach = on_attach,
	filetypes = { "cfn" },
	settings = {
		yaml = {
			customTags = {
        "!And scalar",
        "!And mapping",
        "!And sequence",
        "!If scalar",
        "!If mapping",
        "!If sequence",
        "!Not scalar",
        "!Not mapping",
        "!Not sequence",
        "!Equals scalar",
        "!Equals mapping",
        "!Equals sequence",
        "!Or scalar",
        "!Or mapping",
        "!Or sequence",
        "!FindInMap scalar",
        "!FindInMap mappping",
        "!FindInMap sequence",
        "!Base64 scalar",
        "!Base64 mapping",
        "!Base64 sequence",
        "!Cidr scalar",
        "!Cidr mapping",
        "!Cidr sequence",
        "!Ref scalar",
        "!Ref mapping",
        "!Ref sequence",
        "!Sub scalar",
        "!Sub mapping",
        "!Sub sequence",
        "!GetAtt scalar",
        "!GetAtt mapping",
        "!GetAtt sequence",
        "!GetAZs scalar",
        "!GetAZs mapping",
        "!GetAZs sequence",
        "!ImportValue scalar",
        "!ImportValue mapping",
        "!ImportValue sequence",
        "!Select scalar",
        "!Select mapping",
        "!Select sequence",
        "!Split scalar",
        "!Split mapping",
        "!Split sequence",
        "!Join scalar",
        "!Join mapping",
        "!Join sequence"

			},
			trace = {
				server = { "messages" }
			},
			schemas = cfn_schema,
			validate = true,
			format = {
				enable = true,
			},
		},
	},
}
