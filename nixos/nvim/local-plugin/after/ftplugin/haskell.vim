if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

" ----- neovimhaskell/haskell-vim -----
"2 spaces for tab 
set ts=2 sw=2 ai
set expandtab

augroup haskell
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
	"Intero auto reloading
	autocmd BufWritePost * InteroReload
augroup END

"Moving from repl
tnoremap <C-H> <C-\><C-n><C-W>h
tnoremap <C-T> <C-\><C-n><C-W>j
tnoremap <C-N> <C-\><C-n><C-W>k
tnoremap <C-S> <C-\><C-n><C-W>l

nnoremap <silent> <leader>io :InteroOpen<CR>
nnoremap <silent> <leader>im :InteroLoadCurrentModule<CR>
nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2
