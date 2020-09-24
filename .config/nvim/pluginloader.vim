runtime platform.vim

"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif
" Required:
exec "set runtimepath+=" . configPath . expand('pluginInstalls/repos/github.com/Shougo/dein.vim')
" Required:
if dein#load_state(configPath . 'pluginInstalls')
	call dein#begin(configPath . 'pluginInstalls')
	call dein#add(configPath . 'pluginInstalls//repos/github.com/Shougo/dein.vim')

	"side pane with tags (funcs etc)
	call dein#add('majutsushi/tagbar')
	"Fuzzy finder
	call dein#add('ctrlpvim/ctrlp.vim')
	"Status bar
	call dein#add('vim-airline/vim-airline')
	"Jump in files, azm
	call dein#add('easymotion/vim-easymotion')
	"Shows changes in the gutter
	call dein#add('airblade/vim-gitgutter')
	"Git integration vim
	call dein#add('tpope/vim-fugitive')
	"To run Gpush asyncronously
	call dein#add('tpope/vim-dispatch')
	"Cool themes for status bar
	call dein#add('vim-airline/vim-airline-themes')
	"Awesome golang plugin
	call dein#add('fatih/vim-go')
	call dein#add('neomake/neomake')
	"Latex integration
	call dein#add('lervag/vimtex')
	"Currently used theme
	call dein#add('kristijanhusak/vim-hybrid-material')
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
	"call dein#add('dense-analysis/ale')
	call dein#add('bufbuild/vim-buf')
	"bats highlightning (bash test framework)
	call dein#add('aliou/bats.vim')
	"journaling and link connected wiki"
	call dein#add('vimwiki/vimwiki')
	"Better spelling checking
	"takes care of camelcase etc.
	call dein#add('kamykn/spelunker.vim')
	"OpenSCAD highlight
	call dein#add('sirtaj/vim-openscad')
	"coc intellisense context auto completion
	call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
	call dein#end()
	call dein#save_state()
endif
"use command
"call dein#install()

command DeinDeleteRemovedPlugins :call dein#recache_runtimepath() | :call map(dein#check_clean(), "delete(v:val, 'rf')")

filetype plugin on 
syntax on
