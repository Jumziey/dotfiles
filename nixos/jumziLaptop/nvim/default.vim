"
" NEOVIM DEFAULT SETTINGS
"
" Ignoring files usincg just about all 
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" Mouse works in all modes
set mouse=a
"Yank to clipboard
set clipboard+=unnamedplus

"see https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150

"Encoding
set encoding=utf-8

"Dvorak
noremap t j
noremap n k
noremap s l
map <Space> <Leader>

"Window moving
"" Almost all modes
noremap <C-H> <C-W>h
noremap <C-T> <C-W>j
noremap <C-N> <C-W>k
noremap <C-S> <C-W>l
noremap <C-R>h :resize +5<CR>
noremap <C-R>s :resize -5<CR>

"" Term mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-t> <C-\><C-N><C-w>j
tnoremap <C-n> <C-\><C-N><C-w>k
tnoremap <C-s> <C-\><C-N><C-w>l
tnoremap <C-w> <C-\><C-n>

"link following
noremap <c-g> <c-]>
noremap <c-c> <c-o>

"tags following
noremap <c-g> <c-]>
noremap <c-c> :tselect<CR>

"Alternate
noremap <F12> :A<CR>


" tabs should be two spaces! I don't care what you think
set tabstop=2 sw=2 ai
set expandtab

"Spelling
set spelllang=en,sv

"Some awesome plugin debugging
command! ProfileStart  :profile start profile.log | profile func * | profile file * 
command! ProfileStop  :profile stop | qall

