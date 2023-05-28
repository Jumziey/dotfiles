if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

lua << EOF
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.format({async = false})
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
		params.context = {only = {"source.organizeImports"}}

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})
EOF

"Faith related commands mostly
"set autowrite
"let g:go_statusline_duration = 1
"let g:go_highlight_types = 1
"let g:go_fmt_command = 'goimports'
"map <F8> :GoBuild<CR>
"map <F9> :GoRun<CR>
"map <F12> :GoAlternate<CR>
"
""Tag following for go
""let g:go_def_mapping_enabled = 0
""must be set in default.vim
"noremap <silent> <C-g> :GoDef<CR>
""noremap <C-o> :GoDefPop<CR>
""noremap <c-t> <Nop>
""noremap <c-t> <C-W>j
"
"
""Seem to have some issue with guru
"let g:go_def_mode = 'godef'
"
""Smaller terminal on gorun etc
"let g:go_term_width = 45
"
"
"
"augroup go
"  autocmd!
"	" Auto Formatting
"  autocmd BufWritePre * GoMetaLinter
"augroup END
