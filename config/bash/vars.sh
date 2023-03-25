#!/usr/bin/env bash

# Application defaults
export EDITOR="vim"
export TERM="xterm-256color"

# Misc.
export ALIASES="${HOME}/.env/config/bash/aliases"
export CONFIG="${HOME}/.env/config"
export ENV="${HOME}/.env"
export FUNCTIONS="${HOME}/.env/config/bash/functions"
export GOPATH="${HOME}/go"
export GSH="${HOME}/.env/gsh"
export PGP_KEY_ID="0x3260255327CBCDA1"
export SCREENSHOTS="${HOME}/Pictures/screenshots"
export SCRIPTS="${HOME}/.env/scripts"
export SECRETS="${HOME}/.env/config/secrets"
export VARS="${HOME}/.env/config/bash/vars.sh"

## Docker
#export DOCKER_BUILDKIT=1

## PGP
export GPG_TTY="$(tty)"
export PGP_KEY_ID="0x3260255327CBCDA1"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
