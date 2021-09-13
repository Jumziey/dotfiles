noremap <silent> <Leader>w  <cmd>HopWord<cr>
noremap <silent> <Leader>t  <cmd>HopLine<cr>
noremap <silent> <Leader>n  <cmd>HopChar2<cr>


highlight HopNextKey ctermfg=10  
highlight HopNextKey1 ctermfg=10
highlight HopNextKey2 ctermfg=2

lua << EOF
require'hop'.setup()
EOF
