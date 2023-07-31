" Python/YAML config ----------------------------------------------------------
autocmd BufNewFile *.py
    \ :0r ~/.vim/templates/python.template                                  |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd Filetype python
    \ nnoremap <buffer> <C-h> :execute "!pydoc3 " . expand("<cword>")<CR>

autocmd Filetype python
    \ set autoindent                                                        |
    \ set tabstop=4                                                         |
    \ set softtabstop=4                                                     |
    \ set expandtab                                                         |
    \ set colorcolumn=76,121                                                |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap
