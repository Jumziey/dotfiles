if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

map <buffer> <F12> :VimtexToggleMain<CR>
