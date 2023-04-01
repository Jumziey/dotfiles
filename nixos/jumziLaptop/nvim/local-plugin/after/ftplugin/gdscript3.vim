if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

" Getting the tabbing 
set tabstop=8 
set expandtab 
set shiftwidth=4 
set softtabstop=4

" set ft to gdscript instead
" i dont really know why we differentatiate
set filetype=gdscript

augroup gdscript
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

" Custom maps
map <F9> :GodotRunCurrent<CR>

