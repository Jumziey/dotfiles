if exists('b:did_after_ftplugin')
	finish
endif
let b:did_after_ftplugin = 1

if !hasmapto(':PlantumlOpen<CR>')
	map <buffer> <F9> :PlantumlOpen<CR>
endif
