" Docker-compose config -------------------------------------------------------
autocmd BufNewFile docker-compose.y*ml
    \ :0r ~/.vim/templates/docker-compose.yml.template                      |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/                                 |
    \ set colorcolumn=16,78,121

autocmd BufNewFile,BufRead docker-compose.y*ml
    \ set colorcolumn=16,78,121
