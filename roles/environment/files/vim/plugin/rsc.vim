" Shell script config ---------------------------------------------------------
autocmd BufNewFile *.rsc
    \ :0r ~/.vim/templates/rsc.template                                     |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/
