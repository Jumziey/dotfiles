call neomake#configure#automake('rw')

augroup sh
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

map <F11> :execute "!bats " . fnamemodify(expand('%:p'), ':r') . ".bats"<CR>
