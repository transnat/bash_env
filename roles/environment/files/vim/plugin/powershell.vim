" Powershell script config ---------------------------------------------------------
autocmd BufNewFile *.ps1
    \ :0r ~/.vim/templates/powershell.template                              |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/                                 |
    \ set colorcolumn=80,121

autocmd BufRead *.ps1
    \ set colorcolumn=80,121
