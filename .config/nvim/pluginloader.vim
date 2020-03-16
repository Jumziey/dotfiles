
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=$HOME/.config/nvim/pluginInstalls/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state(configPath . 'pluginInstalls/')
  call dein#begin(configPath . 'pluginInstalls/')
  call dein#add(configPath . 'pluginInstalls//repos/github.com/Shougo/dein.vim')

	"Tag helper
  call dein#add('szw/vim-tags')
	"side pane with tags (funcs etc)
  call dein#add('majutsushi/tagbar')
	"Fuzzy finder
  call dein#add('ctrlpvim/ctrlp.vim')
	"Status bar
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
	"Jump in files, azm
  call dein#add('easymotion/vim-easymotion')
	"Shows changes in the gutter
  call dein#add('airblade/vim-gitgutter')
	"Git integration vim
  call dein#add('tpope/vim-fugitive')
	"Cool themes for status bar
  call dein#add('vim-airline/vim-airline-themes')
	"Awesome golang plugin
  call dein#add('fatih/vim-go')
	"Syntax checker
  "call dein#add('vim-syntastic/syntastic')
  call dein#add('neomake/neomake')
	"Shows hex colors etc
  call dein#add('chrisbra/Colorizer')
	"Latex integration
  call dein#add('lervag/vimtex')
	"Tab completer
	call dein#add('Shougo/deoplete.nvim')
	"Currently used theme
  call dein#add('kristijanhusak/vim-hybrid-material')
	"Integration with vifm
  call dein#add('vifm/neovim-vifm')
    "Formats code on save
  call dein#add('sbdchd/neoformat')
	"Alternate between header and source file
	call dein#add('vim-scripts/a.vim')
	"QML highlight
	call dein#add('peterhoeg/vim-qml')
	"Bitbake highlight
	call dein#add('kergoth/vim-bitbake')
	"Better haskell highlight
	call dein#add('neovimhaskell/haskell-vim')
	"Awesome haskell REPL
	call dein#add('parsonsmatt/intero-neovim')
	"Markdown Preview
	"needs:
	"  - node
	"  - yarn
	call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'sh -c "cd app & yarn install"' })
	"GDscript completion and highlighting
  call dein#add('calviken/vim-gdscript3')
	"protobuf linter
	call dein#add('dense-analysis/ale')
	call dein#add('bufbuild/vim-buf')
  call dein#end()
  call dein#save_state()
endif
"use command
"call dein#install()

filetype plugin indent on
syntax enable

