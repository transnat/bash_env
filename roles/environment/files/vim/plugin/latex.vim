" LaTeX config ----------------------------------------------------------------
autocmd BufRead *.tex
    \ set colorcolumn=80,121

autocmd BufNewFile *.tex
    \ :0r ~/.vim/templates/latex.template
