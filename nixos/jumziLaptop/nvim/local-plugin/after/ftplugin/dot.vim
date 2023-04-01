if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

command! GraphvizPreview :GraphvizCompile png | :Graphviz png

map <F8> :GraphvizCompile png<CR>
map <F9> :GraphvizPreview<CR>

