if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

set ts=4 sw=4 ai
set expandtab

map <buffer> <F9> :QmlScene<CR>
