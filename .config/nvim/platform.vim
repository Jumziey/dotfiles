let configPath = fnamemodify($MYVIMRC, ':h')
let configPath = configPath . expand('/')

if has('unix')
	runtime linux.vim
elseif has('win32')
	runtime win.vim
endif

