call neomake#configure#automake('rw')

map <F11> :execute "!bats " . fnamemodify(expand('%:p'), ':r') . ".bats"<CR>
map <F12> execute "e " . fnamemodify(expand('%:p'), ':r') . ".sh"<CR>
