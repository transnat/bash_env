" Terraform configs -----------------------------------------------------------
autocmd BufNewFile terragrunt.hcl
    \ :0r ~/.vim/templates/terragrunt.hcl.template                          |
    \ :3s/\<DATE\>/\=strftime("%B %d, %Y")/
