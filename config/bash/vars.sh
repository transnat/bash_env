#!/bin/bash

# Application defaults.
export EDITOR=vim
export TERM=xterm-256color

# Personal defaults.
export ALIASES="${HOME}/.env/config/bash/aliases"
export CONFIG="${HOME}/.env/config"
export ENV="${HOME}/.env"
export FUNCTIONS="${HOME}/.env/config/bash/functions"
export GSH="${HOME}/.env/gsh"
export SCREENSHOTS="${HOME}/Pictures/screenshots"
export SCRIPTS="${HOME}/.env/scripts"
export SECRETS="${HOME}/.env/config/bash/secrets.asc"
export VARS="${HOME}/.env/config/bash/vars.sh"

## Docker variables.
#export DOCKER_BUILDKIT=1

## GPG variables.
export GPG_KEY_ID="0x3260255327CBCDA1"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
