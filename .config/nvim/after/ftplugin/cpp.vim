
set ts=4 sw=4 ai
set expandtab
map <buffer> <F12> :A<CR>

" Autoformatting
augroup fmt
  autocmd!
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

"Qt syntax
autocmd BufEnter,BufWritePost * runtime expand('syntax/qt.vim')

let g:neomake_cpp_enabled_makers = ['']
call neomake#configure#automake('')

