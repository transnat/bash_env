" Shell script config ---------------------------------------------------------
autocmd BufNewFile *.rsc
    \ :0r ~/.vim/templates/rsc.template                                     |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/                                 |
    \ :set colorcolumn=76,121

autocmd BufRead *.rsc
    \ :set colorcolumn=76,121
