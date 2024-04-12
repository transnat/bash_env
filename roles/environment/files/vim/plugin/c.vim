" C/C++ config ----------------------------------------------------------------
autocmd BufNewFile *.{c{,pp},h}
    \ set filetype=c

autocmd Filetype c
    \ set colorcolumn=52,121                                                |
    \ set autoindent                                                        |
    \ set tabstop=4                                                         |
    \ set softtabstop=4                                                     |
    \ set expandtab                                                         |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap
