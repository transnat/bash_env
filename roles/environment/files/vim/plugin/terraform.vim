" Terraform configs -----------------------------------------------------------
autocmd Filetype terraform
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap

autocmd BufNewFile providers.tf
    \ set textwidth=120                                                     |
    \ set linebreak                                                         |
    \ set wrap                                                              |
    \ :0r ~/.vim/templates/terraform.d/providers.tf

autocmd BufNewFile variables.tf
    \ :0r ~/.vim/templates/terraform.d/variables.tf

autocmd BufNewFile *.tf
    \ :0r ~/.vim/templates/terraform.d/main.tf                              |
    \ :5s/\<DATE\>/\=strftime("%B %d, %Y")/

autocmd BufNewFile *.hcl
    \ :0r ~/.vim/templates/terraform.d/main.tf                              |
    \ :5s/\<DATE\>/\=strftime("%B %d, %Y")/
