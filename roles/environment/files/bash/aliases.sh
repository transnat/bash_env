alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias F='fuck'
alias back='cd ${OLDPWD}'
alias betterlockscreen='betterlockscreen --update "${HOME}/Pictures/backgrounds/${HOSTNAME}.jpg"'
alias c='clear'
alias chr='chmod 644'
alias chx='chmod 755'
alias cl='clear;ls -lFh'
alias cla='clear;ls -lFha'
alias clip='xclip -sel clip'
alias cputemp='sensors | grep Core'
alias df='df -h'
alias dfimage='docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage -sV=1.36'
alias dgrep='l|grep'
alias dirs='dirs -p'
alias flake8='flake8 --max-line-length=120'
alias free='free -h'
alias gam='${HOME}/.local/bin/gam/gam'
alias gca='gpg-connect-agent updatestartuptty /bye'
alias gcn='gpg-connect-agent \"scd serialno\" \"learn --force\" /bye'
alias grEp='grep -E'
alias grIp='grep -iE'
alias grVp='grep -vE'
alias grip='grep -i'
alias grvp='grep -v'
alias h='history'
alias hgrep='history|grep -E'
alias hping='hping3'
alias l='ls -1'
alias la='ls -lFha'
alias less='less -R'
alias ll='ls -lFh'
alias msf='msfconsole --quiet -x \"db_connect '\''user'\''@'\''msf'\''\"'
alias mysql='mysql -u $(whoami) -p'
alias open='xdg-open'
alias pclip='pwd | xclip -sel clip'
alias ps1='pwsh'
alias pylint='pylint --rcfile ${HOME}/.config/pylint.pylintrc'
alias q='exit'
alias rmf='rm -rf'
alias src='source ${HOME}/.bashrc'
alias tf='terraform'
alias tf='terraform'
alias tg='terragrunt'
alias va='source ./venv/bin/activate'
alias ve='python3 -m venv ./venv'
alias yamllint='yamllint -d ${HOME}/.config/yamllint.yml'
