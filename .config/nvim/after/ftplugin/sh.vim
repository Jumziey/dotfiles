call neomake#configure#automake('rw')

augroup sh
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

map <buffer> <F9> :!%:p<CR>

map <buffer> <F11> :execute "terminal cd " . fnamemodify(expand('%:p'), ':h') . ";" . "bats " . fnamemodify(expand('%:t'), ':r') . ".bats"<CR>
map <buffer> <F12> :execute "edit " . fnamemodify(expand('%:p'), ':r') . ".bats\n"<CR>
