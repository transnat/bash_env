" Terraform configs -----------------------------------------------------------
autocmd! filetypedetect BufNewFile,BufRead *.tf
    \ set filetype=terraform                                                |
    \ set colorcolumn=80,121

autocmd BufRead,BufNewFile *.hcl
    \ set filetype=terraform

autocmd BufRead,BufNewFile *.tfstate
    \ set filetype=json

autocmd BufRead,BufNewFile *.tfstate.backup
    \ set filetype=json

autocmd BufRead,BufNewFile *.tfvars
    \ set filetype=terraform

autocmd BufNewFile main.tf
    \ :0r ~/.vim/templates/terraform.d/main.tf

autocmd BufNewFile providers.tf
    \ :0r ~/.vim/templates/terraform.d/providers.tf

autocmd BufNewFile variables.tf
    \ :0r ~/.vim/templates/terraform.d/variables.tf
