#!/bin/bash

# Application defaults.
export EDITOR=vim
export TERM=xterm-256color

# Personal defaults.
export ALIASES="${HOME}/.env/config/aliases"
export ENV="${HOME}/.env"
export FUNCTIONS="${HOME}/.env/functions"
export GSH="${HOME}/.env/gsh"
export SCREENSHOTS="${HOME}/Pictures/screenshots"
export SCRIPTS="${HOME}/.env/scripts"
export SECRETS="${HOME}/.env/secrets.asc"
export VARS="${HOME}/.env/vars.sh"
export WINEPREFIX="${HOME}/.config/wine"

## Docker variables.
#export DOCKER_BUILDKIT=1

## GPG variables for SSH.
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
