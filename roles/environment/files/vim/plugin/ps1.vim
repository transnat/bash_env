" Powershell script config ---------------------------------------------------------
autocmd BufNewFile *.ps1
    \ :0r ~/.vim/templates/ps1.template                                     |
    \ :2s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd BufRead *.ps1
    \ set colorcolumn=76,121
