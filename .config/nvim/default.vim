"
" NEOVIM DEFAULT SETTINGS
"
"Need to ignore some stuff 
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" Mouse works in all modes
set mouse=a

"see https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150

"Load local init.vim
set exrc
set secure "not autocmd etc

"Encoding
set encoding=utf-8

"Dvorak
noremap t j
noremap n k
noremap s l
map <Space> <Leader>

"Window moving
"Hack to work with vim-go
let g:go_def_mapping_enabled=0
noremap <C-H> <C-W>h
noremap <C-T> <C-W>j
noremap <C-N> <C-W>k
noremap <C-S> <C-W>l
noremap <C-R>h :resize +5<CR>
noremap <C-R>s :resize -5<CR>

"link following
noremap <c-g> <c-]>
noremap <c-c> <c-o>

set tabstop=2 sw=2 ai

"Spelling
set spelllang=en,sv

"colorscheme
set termguicolors
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

"tags following
noremap <c-g> <c-]>
noremap <c-c> :tselect<CR>

"Yank to clipboard
set clipboard+=unnamedplus

"Source everything in default map (plugin settings)
for f in split(glob(configPath . 'default/*.vim'), '\n')
    exe 'source' f
endfor

command! ProfileStart  :profile start profile.log | profile func * | profile file * 
command! ProfileStop  :profile stop | qall

