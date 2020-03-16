"Faith related commands mostly
set autowrite
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
map <F8> :GoBuild<CR>
map <F9> :GoRun<CR>
map <F11> :GoTest<CR>
map <F10> :GoTestFunc<CR>
map <F12> :GoAlternate<CR>

"Tag following for go
"let g:go_def_mapping_enabled = 0
"must be set in default.vim
noremap <C-g> :GoDef<CR>
noremap <C-c> :GoDefPop<CR>

noremap <c-t> <Nop>
noremap <c-t> <C-W>j


"Seem to have some issue with guru
let g:go_def_mode = 'godef'

"Smaller terminal on gorun etc
let g:go_term_width = 45

" neomake
let g:neomake_go_enabled_makers = [ 'go', 'golangci_lint', 'golint', 'govet' ]
