call neomake#configure#automake('rw')

"indenting
set tabstop=4 |
set softtabstop=4 |
set shiftwidth=4 |
set textwidth=79 |
set expandtab |
set autoindent |
set fileformat=unix

"Autoformattng
let g:neoformat_enabled_python = ['yapf']
augroup python
	autocmd!
	autocmd BufWritePre * Neoformat
augroup END

"Running script
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

