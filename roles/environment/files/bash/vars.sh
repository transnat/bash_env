#!/usr/bin/env bash
#-*- coding:utf-8 -*-

BROWSER="$(which google-chrome)"
GPG_TTY="$(tty)"
SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# Application defaults
export BROWSER
export EDITOR="vim"
export TERM="xterm-256color"

# Misc.
export ALIASES="${HOME}/.bash/aliases.sh"
export DOCKER_HOST="unix:///var/run/docker.sock"
export DOMAIN="taumotors.com"
export GOPATH="${HOME}/.local/share/go"
export FUNCTIONS="${HOME}/.bash/functions/"
export GH="git@github.com"
export SCRIPTS="${HOME}/.local/lib/scripts/"
export TMPDIR="${HOME}/tmp"
export VARS="${HOME}/.bash/vars.sh"

## Ansible
export ANSIBLE_DUPLICATE_YAML_DICT_KEY=ignore

## Docker
#export DOCKER_BUILDKIT=1

## GAM
export GOOGLE_CREDENTIALS_PATH="/home/caseysparkz/.local/bin/gam/client_secrets.json"

## PGP
export GPG_TTY
export PGP_KEY_ID="0xF64015B97A016D10"

## SSH
export SSH_AUTH_SOCK

## Terraform
export TF_CLI_CONFIG_FILE="${HOME}/.terraform.d/terraformrc"
export TF_LOG="trace"
export TF_LOG_PATH="./terraform.log"
