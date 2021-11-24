#!/bin/bash

# Personal defaults.
export EDITOR=vim
export TERM=xterm-256color
export ALIASES="${HOME}/.env/config/aliases"
export FUNCTIONS="${HOME}/.env/functions"
export SCRIPTS="${HOME}/.env/scripts"
export GSH="${HOME}/.env/gsh"
export SCREENSHOTS="${HOME}/Pictures/screenshots"
export SECRETS="${HOME}/.env/secrets.asc"

## Docker variables.
#export DOCKER_BUILDKIT=1

## GPG variables for SSH.
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
