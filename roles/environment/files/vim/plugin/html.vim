" Python config ---------------------------------------------------------------
autocmd BufNewFile *.html
    \ set filetype=html                                                     |
    \ :0r ~/.vim/templates/html.template                                    |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd BufRead *.html
    \ set filetype=html

autocmd Filetype html
    \ set autoindent                                                        |
    \ set tabstop=4                                                         |
    \ set softtabstop=4                                                     |
    \ set expandtab                                                         |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap                                                              |
    \ set syntax=html
