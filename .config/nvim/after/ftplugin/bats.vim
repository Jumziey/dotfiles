call neomake#configure#automake('rw')

map <F11> :execute "!bats " . fnamemodify(expand('%:p'), ':r') . ".bats"<CR>
