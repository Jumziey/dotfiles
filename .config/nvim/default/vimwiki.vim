let jumzi_wiki = {}
let jumzi_wiki.path = '~/.vimwiki/'
let jumzi_wiki.syntax = 'markdown'
let jumzi_wiki.ext = '.md'

let g:vimwiki_list = [jumzi_wiki]


nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
nmap <Leader>di <Plug>VimwikiDiaryIndex
nmap <Leader>d<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>d<Leader>y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>d<Leader>m <Plug>VimwikiMakeTomorrowDiaryNote


nmap <Leader>vw <Plug>VimwikiIndex
nmap <Leader>vt <Plug>VimwikiTabIndex
nmap <Leader>vs <Plug>VimwikiUISelect

"Local mappings is made global
"Since they interfere with the 
"<Leader>w binding otherwise for easymotion
nmap <Leader>vh <Plug>Vimwiki2HTML
nmap <Leader>vhh <Plug>Vimwiki2HTMLBrowse
nmap <Leader>v<Leader>i <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>v<Leader>d <Plug>VimwikiDeleteLink
nmap <Leader>v<Leader>r <Plug>VimwikiRenameLink
