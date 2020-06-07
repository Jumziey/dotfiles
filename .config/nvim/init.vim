
let configPath = fnamemodify($MYVIMRC, ':h') 
if has('unix')
	let configPath = configPath . '/'
	exec "source " . configPath . 'linux.vim'
elseif has('win32')
	let configPath = configPath . '\'
	exec "source " . configPath . 'win.vim'
endif

exec "source " . configPath . "pluginloader.vim"
exec "source " . configPath . "default.vim"
exec "source " . configPath . "ftpluginloader.vim"

"Load local init.vim
set exrc
set secure 
