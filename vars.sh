#!/bin/bash

# Personal defaults.
export EDITOR=vim
export TERM=xterm-256color
export FUNCTIONS="${HOME}/.env/functions"
export SCRIPTS="${HOME}/.env/scripts"
export GSH="${HOME}/.env/gsh"
export SECRETS="${HOME}/.env/secrets"

## GPG variables for SSH.
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

## Misc. variables.
AWS_ECR=770088062852.dkr.ecr.us-east-1.amazonaws.com
