call neomake#configure#automake('rw')

map <buffer> <F11> :execute "!bats " . fnamemodify(expand('%:p'), ':r') . ".bats"<CR>
map <buffer> <F12> :execute "edit " . fnamemodify(expand('%:p'), ':r') . ".sh"<CR>
