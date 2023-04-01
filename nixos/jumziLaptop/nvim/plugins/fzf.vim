
command! -bang -nargs=? -complete=dir GFilesPwd
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'dir': getcwd()}))

noremap <silent> <C-p> :GFilesPwd<cr>
