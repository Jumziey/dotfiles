let jumzi_wiki = {}
let jumzi_wiki.path = '~/.vimwiki/'

let g:vimwiki_list = [jumzi_wiki]


nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
nmap <Leader>d<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>dm <Plug>VimwikiMakeTomorrowDiaryNote

nmap <Leader>di <Plug>VimwikiDiaryIndex
nmap <Leader>dI <Plug>VimwikiDiaryGenerateLinks


nmap <Leader>vw <Plug>VimwikiIndex
nmap <Leader>vt <Plug>VimwikiTabIndex
nmap <Leader>vs <Plug>VimwikiUISelect

"Local mappings is made global
"Since they interfere with the 
"<Leader>w binding otherwise for easymotion
nmap <Leader>vh <Plug>Vimwiki2HTML
nmap <Leader>vhh <Plug>Vimwiki2HTMLBrowse
nmap <Leader>vd <Plug>VimwikiDeleteLink
nmap <Leader>vr <Plug>VimwikiRenameLink

nmap <c-w> <Plug>VimwikiToggleListItem
