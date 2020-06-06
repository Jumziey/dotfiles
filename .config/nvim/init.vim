"
" CONFIG
"

"pdf reader binary
let pdfReader = 'zathura'
"Path to python3 binary
let python3Binary = '/usr/bin/python3'
"Path to neovim config dir
let configPath = "~/.config/nvim/"


"
" FUNCTION
"

"Setting up some default paths
let pluginloaderPath = configPath . "pluginloader.vim"
let defaultPath = configPath . "default.vim"

exec "source " . pluginloaderPath
exec "source " . defaultPath

exec "source " . configPath . "pluginloader.vim"
exec "source " . configPath . "default.vim"
exec "source " . configPath . "ftpluginloader.vim"

"Load local init.vim
set exrc
set secure 
