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

au BufNewFile,BufRead *.py source ~/.config/nvim/lang/python.vim
au BufNewFile,BufRead *.go source ~/.config/nvim/lang/golang.vim
au BufNewFile,BufRead *.tex source ~/.config/nvim/lang/latex.vim
au BufNewFile,BufRead *.md source ~/.config/nvim/lang/markdown.vim
au BufNewFile,BufRead *.cc source ~/.config/nvim/lang/cpp.vim
au BufNewFile,BufRead *.cpp source ~/.config/nvim/lang/cpp.vim
au BufNewFile,BufRead *.qml source ~/.config/nvim/lang/qml.vim
au BufNewFile,BufRead *.c source ~/.config/nvim/lang/c.vim
au BufNewFile,BufRead *.h source ~/.config/nvim/lang/cpp.vim
au BufNewFile,BufRead *.php source ~/.config/nvim/lang/php.vim
au BufNewFile,BufRead *.pri source ~/.config/nvim/lang/pri.vim
au BufNewFile,BufRead *.pro source ~/.config/nvim/lang/pro.vim
au BufNewFile,BufRead *.slide source ~/.config/nvim/lang/slide.vim
au BufNewFile,BufRead *.hs source ~/.config/nvim/lang/hs.vim
au BufNewFile,BufRead *.proto source ~/.config/nvim/lang/proto.vim
au BufNewFile,BufRead *.bazel source ~/.config/nvim/lang/bazel.vim

"Load local init.vim
set exrc
set secure 
