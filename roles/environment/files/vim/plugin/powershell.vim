" Powershell script config ---------------------------------------------------------
autocmd BufNewFile *.ps1
    \ :0r ~/.vim/templates/powershell.template                              |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/
