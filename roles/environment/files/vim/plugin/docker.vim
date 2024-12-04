" Docker-compose config -------------------------------------------------------
autocmd BufNewFile *docker-compose.y*ml
    \ :0r ~/.vim/templates/docker-compose.yml.template                      |
    \ :3s/DATE/\=strftime("%B %d, %Y")/                                     |
    \ :%s/NAME/\=fnamemodify(@%, ':gs?.docker-compose.yml??')/              |
    \ set colorcolumn=16,78,121

autocmd BufNewFile,BufRead *docker-compose.y*ml
    \ set colorcolumn=80,121                                                |
    \ set autoindent                                                        |
    \ set tabstop=2                                                         |
    \ set softtabstop=2                                                     |
    \ set expandtab                                                         |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap

" Docker config ---------------------------------------------------------------
