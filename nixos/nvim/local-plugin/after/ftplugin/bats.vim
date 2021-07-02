call neomake#configure#automake('rw')

map <buffer> <F12> :execute "edit " . fnamemodify(expand('%:p'), ':r') . ".sh"<CR>
