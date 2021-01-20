call neomake#configure#automake('rw')
let g:neomake_python_enabled_makers = [ 'pylint' ]

"indenting
set tabstop=4 |
set softtabstop=4 |
set shiftwidth=4 |
set textwidth=79 |
set expandtab |
set autoindent |
set fileformat=unix

"Autoformattng
let g:neoformat_enabled_python = ['autopep8']
augroup python
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END

"Running script
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

