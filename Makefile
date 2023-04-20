.PHONY: all
.PHONY: test
.PHONY: clean

all: prerequisite bash git gpg python screen ssh vim

ENV_DIR := "${HOME}/.env"
CONF_DIR := "${ENV_DIR}/config"
SCRIPTS_DIR := "${ENV_DIR}/scripts"
GPG_DIR := "${HOME}/.gnupg"
SSH_DIR := "${HOME}/.ssh"

prerequisite:
	@sudo chown -Rc ${USER}:${USER}         ${ENV_DIR}

bash:
	@rm -rf ${HOME}/.bash* ${HOME}/.profile 2> /dev/null
	@ln -s ${CONF_DIR}/bash/bash_logout     ${HOME}/.bash_logout
	@ln -s ${CONF_DIR}/bash/bash_profile    ${HOME}/.bash_profile
	@ln -s ${CONF_DIR}/bash/bashrc          ${HOME}/.bashrc
	@ln -s ${CONF_DIR}/profile              ${HOME}/.profile

git:
	@rm -f ${HOME}/.gitconfig || true
	@ln -s ${CONF_DIR}/git/gitconfig        ${HOME}/.gitconfig


gpg:
	@rm -rf ${GPG_DIR} 2> /dev/null
	@mkdir -m 700 ${GPG_DIR}
	@cp -r ${CONF_DIR}/gnupg/*.conf         ${GPG_DIR}
	@curl https://keys.caseyspar.kz/public.asc | gpg --import

python:
	@python -m ensurepip --upgrade
	@pip install --user	--no-cache-dir -r   ${CONF_DIR}/python/requirements.txt

screen:
	@rm -rf ${HOME}/.screenrc || true
	@ln -s ${CONF_DIR}/screen/screenrc      ${HOME}/.screenrc


ssh:
	@mkdir -m 700 ${SSH_DIR} || true
	@wget -q https://keys.caseyspar.kz/authorized_keys -o ${SSH_DIR}/smartcard.pub
	@chmod 600 ${SSH_DIR}/*
	@ssh-add ${SSH_DIR}/smartcard.pub 2> /dev/null

vim:
	@rm -rf ${HOME}/.vim 2> /dev/null
	@rm -rf ${HOME}/.vimrc 2> /dev/null
	@ln -s ${CONF_DIR}/vim                  ${HOME}/.vim
	@ln -s ${CONF_DIR}/vim/vimrc            ${HOME}/.vimrc
