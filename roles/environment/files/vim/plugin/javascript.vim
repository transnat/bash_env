" Python/YAML config ----------------------------------------------------------
autocmd BufNewFile *.js
    \ :0r ~/.vim/templates/javascript.template                              |
    \ :2s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd Filetype js
    \ set autoindent                                                        |
    \ set tabstop=2                                                         |
    \ set softtabstop=2                                                     |
    \ set expandtab                                                         |
    \ set colorcolumn=76,121                                                |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap
