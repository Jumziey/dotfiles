"indenting
set tabstop=4 |
set softtabstop=4 |
set shiftwidth=4 |
set textwidth=79 |
set expandtab |
set autoindent |
set fileformat=unix

"syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E231,E226,E251,E501,E301,E128'

"Autoformattng
let g:neoformat_enabled_python = ['yapf']
autocmd BufWritePre * Neoformat
"Running script
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

