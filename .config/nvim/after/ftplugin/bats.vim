call neomake#configure#automake('rw')

map <buffer> <F11> :execute "terminal cd " . fnamemodify(expand('%:p'), ':h') . ";" . "bats " . fnamemodify(expand('%:t'), ':r') . ".bats"<CR>
map <buffer> <F12> :execute "edit " . fnamemodify(expand('%:p'), ':r') . ".sh"<CR>
