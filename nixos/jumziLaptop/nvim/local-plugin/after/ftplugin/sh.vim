if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

call neomake#configure#automake('rw')

augroup sh
  autocmd!
	" Auto Formatting
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

map <buffer> <F9> :te!%:p<CR>

map <buffer> <F12> :execute "edit " . fnamemodify(expand('%:p'), ':r') . ".bats\n"<CR>
