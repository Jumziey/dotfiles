if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1


call neomake#configure#automake('rw')
let g:neomake_python_enabled_makers = [ 'pylint', 'mypy' ]


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
map <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

