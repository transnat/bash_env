" Shell script config ---------------------------------------------------------
autocmd BufNewFile *.sh
    \ :0r ~/.vim/templates/sh.template                                      |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd BufRead *.rsc
    \set virtualedit=all
