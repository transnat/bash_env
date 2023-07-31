" Shell scripts ---------------------------------------------------------------
autocmd BufNewFile *.sh
    \ :0r ~/.vim/templates/sh.template                                      |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd Filetype sh
    \set colorcolumn=76,121

autocmd BufRead *.rsc
    \set colorcolumn=76,121                                                 \
    \set virtualedit=all
