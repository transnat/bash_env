" LaTeX config ----------------------------------------------------------------
autocmd BufRead *.tex
    \ set colorcolumn=112

autocmd BufNewFile *.tex
    \ :0r ~/.vim/templates/latex.template
