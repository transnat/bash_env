" Python config ---------------------------------------------------------------
autocmd BufNewFile *.py
    \ :0r ~/.vim/templates/python.template                                  |
    \ :4s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd Filetype python
    \ set autoindent                                                        |
    \ set tabstop=4                                                         |
    \ set softtabstop=4                                                     |
    \ set expandtab                                                         |
    \ set modeline                                                          |
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap                                                              |
    \ nnoremap <buffer> <C-h> :execute "!pydoc3 " . expand("<cword>")<CR>
