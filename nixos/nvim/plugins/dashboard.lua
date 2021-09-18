vim.g.dashboard_default_executive ='fzf'
vim.g.dashboard_custom_header = {
"     ██╗██╗   ██╗███╗   ███╗███████╗██╗███████╗██╗   ██╗",
"     ██║██║   ██║████╗ ████║╚══███╔╝██║██╔════╝╚██╗ ██╔╝",
"     ██║██║   ██║██╔████╔██║  ███╔╝ ██║█████╗   ╚████╔╝ ",
"██   ██║██║   ██║██║╚██╔╝██║ ███╔╝  ██║██╔══╝    ╚██╔╝  ",
"╚█████╔╝╚██████╔╝██║ ╚═╝ ██║███████╗██║███████╗   ██║   ",
" ╚════╝  ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝╚══════╝   ╚═╝   ",
"                     - Neovim -                         ",
}



vim.g.dashboard_custom_section = {
    a = {description = {'  Find File            C-p       '}, command = 'DashboardFindFile'},
    b = {description = {'  Find Word            :Rg       '}, command = 'DashboardFindWord'},
    c = {description = {'📁 File Browser         :Ex       '}, command = 'Ex'},
    d = {description = {'📖 jumziWiki            leader v w'}, command = 'VimwikiIndex'},
    e = {description = {'📖 Diary Today 			    leader d n  '}, command = 'VimwikiMakeDiaryNote'},
    f = {description = {'📖 Diary Tomorrow       leader d m'}, command = 'VimwikiMakeTomorrowDiaryNote'},
    g = {description = {'📖 Diary Yesterday      leader d y'}, command = 'VimwikiMakeYesterdayDiaryNote'},
    h = {description = {'  New File         		            '}, command = 'DashboardNewFile'},
    i = {description = {'  Change Color Scheme            '}, command = 'DashboardChangeColorscheme'},
}
vim.g.dashboard_custom_footer = {'type  :help<Enter>  or  <F1>  for on-line help'}
