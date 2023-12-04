" Docker-compose config -------------------------------------------------------
autocmd BufNewFile docker-compose.y*ml
    \ :0r ~/.vim/templates/docker-compose.yml.template
