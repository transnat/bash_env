" Python/YAML config ----------------------------------------------------------
autocmd BufNewFile .gitignore
    \ :0r ~/.vim/templates/gitignore.template                               |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/
