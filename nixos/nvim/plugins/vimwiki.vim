let jumzi_wiki = {}
let jumzi_wiki.path = '~/.vimwiki/'

let g:vimwiki_list = [jumzi_wiki]

let g:vimwiki_key_mappings = { 'all_maps': 0, }

nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
nmap <Leader>d<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>dm <Plug>VimwikiMakeTomorrowDiaryNote

nmap <Leader>di <Plug>VimwikiDiaryIndex
nmap <Leader>dI <Plug>VimwikiDiaryGenerateLinks

nmap <Leader>vw <Plug>VimwikiIndex
nmap <Leader>vt <Plug>VimwikiTabIndex
nmap <Leader>vs <Plug>VimwikiUISelect

nmap <Leader>vh <Plug>Vimwiki2HTML
nmap <Leader>vhh <Plug>Vimwiki2HTMLBrowse
nmap <Leader>vd <Plug>VimwikiDeleteLink
nmap <Leader>vr <Plug>VimwikiRenameLink
