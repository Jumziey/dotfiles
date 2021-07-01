augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> d h
    noremap <buffer> n gk
    noremap <buffer> t gj
    noremap <buffer> s l
endfunction


"autostart netrw in empty buffer
filetype plugin indent on

augroup VimStartup
	au!
	au VimEnter * if expand("%") == "" | e . | endif
augroup END
