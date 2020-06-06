if has('unix')
	exec "source " . fnamemodify($MYVIMRC, ':h') . '/' . 'linux.vim'
elseif has('win32')
	exec "source " . fnamemodify($MYVIMRC, ':h') . '/' . 'win.vim'
endif

exec "source " . configPath . "pluginloader.vim"
exec "source " . configPath . "default.vim"
exec "source " . configPath . "ftpluginloader.vim"

"Load local init.vim
set exrc
set secure 
