" Python config ---------------------------------------------------------------
autocmd BufRead,BufNewFile *.gv
    \ set filetype=dot

autocmd BufRead,BufNewFile *.dot
    \ set filetype=dot

autocmd Filetype dot
    \ set autoindent                                                        |
    \ set tabstop=4                                                         |
    \ set softtabstop=4                                                     |
    \ set expandtab                                                         |
    \ set modeline                                                          |
    \ set textwidth=120
