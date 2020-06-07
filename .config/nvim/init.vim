
let configPath = fnamemodify($MYVIMRC, ':h') 
let dirsep = ""
if has('unix')
	let dirsep = '/'
	let configPath = configPath . dirsep
	exec "source " . configPath . 'linux.vim'
elseif has('win32')
	let dirsep = '\'
	let configPath = configPath . dirsep
	exec "source " . configPath . 'win.vim'
endif

exec "source " . configPath . "pluginloader.vim"
exec "source " . configPath . "default.vim"
exec "source " . configPath . "ftpluginloader.vim"

"Load local init.vim
set exrc
set secure 
