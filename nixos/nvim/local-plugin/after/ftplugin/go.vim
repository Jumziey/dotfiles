if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

"Faith related commands mostly
set autowrite
"let g:go_statusline_duration = 1
"let g:go_highlight_types = 1
"let g:go_fmt_command = 'goimports'
"map <F8> :GoBuild<CR>
"map <F9> :GoRun<CR>
"map <F12> :GoAlternate<CR>

"Tag following for go
"let g:go_def_mapping_enabled = 0
"must be set in default.vim
" noremap <silent> <c-g> :GoDef<CR>
"noremap <C-o> :GoDefPop<CR>


"Seem to have some issue with guru
"let g:go_def_mode = 'godef'

"Smaller terminal on gorun etc
"let g:go_term_width = 45

lua <<EOF
  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF
