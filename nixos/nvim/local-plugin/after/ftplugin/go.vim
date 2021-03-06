if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

"Faith related commands mostly
set autowrite
let g:go_statusline_duration = 1
let g:go_highlight_types = 1
let g:go_fmt_command = 'goimports'
map <F8> :GoBuild<CR>
map <F9> :GoRun<CR>
map <F12> :GoAlternate<CR>

"Tag following for go
"let g:go_def_mapping_enabled = 0
"must be set in default.vim
noremap <silent> gd :GoDef<CR>
"noremap <C-o> :GoDefPop<CR>

noremap <c-t> <Nop>
noremap <c-t> <C-W>j


"Seem to have some issue with guru
let g:go_def_mode = 'godef'

"Smaller terminal on gorun etc
let g:go_term_width = 45

" neomake
let g:neomake_go_enabled_makers = [ 'go', 'golangci_lint', 'golint', 'govet' ]
