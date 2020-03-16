let g:deoplete#enable_at_startup=1

call deoplete#custom#option({
\ 'max_list': 5, 
\ 'auto_complete_delay': 350, 
\ })
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 
