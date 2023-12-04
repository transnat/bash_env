" Helm config -----------------------------------------------------------------
autocmd BufNewFile Chart.yaml
    \ :0r ~/.vim/templates/helm.d/Chart.yaml.template
