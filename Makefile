.PHONY: all
.PHONY: test
.PHONY: clean

# Make variables.
CONF_DIR := "${HOME}/.env/config"
GPG_DIR := "${HOME}/.gnupg"
SCRIPTS_DIR := "${HOME}/.env/scripts"
SSH_DIR := "${HOME}/.ssh"

screen:
	@rm -rf ${HOME}/.screenrc 2>&1 /dev/null 							# Remove default config.
	@ln -s ${CONF_DIR}/screen/screenrc		${HOME}/.screenrc

bash:
	@rm -rf ${HOME}/.{bash*,profile} 2>&1 /dev/null						# Remove default configs.
	@ln -s ${CONF_DIR}/bash/bash_logout		${HOME}/.bash_logout		# Symlink new configs.
	@ln -s ${CONF_DIR}/bash/bash_profile	${HOME}/.bash_profile
	@ln -s ${CONF_DIR}/bash/bashrc			${HOME}/.bashrc
	@ln -s ${CONF_DIR}/profile				${HOME}/.profile


git:
	@rm -f ${HOME}/.gitconfig 2> /dev/null							\	# Remove default config.
	@ln -s ${CONF_DIR}/git/gitconfig		${HOME}/.gitconfig			# Symlink new config.


gpg:
	@rm -rf ${GPG_DIR} 2> /dev/null										# Remove default config.
	@cp -r ${CONF_DIR}/gnupg				${GPG_DIR} 					# Copy in new config.
	@chmod 0700 ${HOME}/.gnupg 											# Own configs.
	@chown -R $(id -u):$(id -g)				${GPG_DIR}
	@curl https://keys.caseyspar.kz/public.asc | gpg --import		\	# Import my identity.


python:
	@python -m ensurepip --upgrade 										# Install pip.
	@pip install --user	--no-cache-dir								\	# Install python requirements.
		-r ${SCRIPTS_DIR}/python/requirements.txt


ssh:
	@mkdir -m 700 ${SSH_DIR} 2> /dev/null								# Make config dir.
	@wget -q https://keys.caseyspar.kz/authorized_keys				\	# Import my identity.
		-o ${SSH_DIR}/smartcard.pub			
	@chmod 600 ${SSH_DIR}/*
	@ssh-add ${SSH_DIR}/smartcard.pub 2> /dev/null						# Add ID to agent.

vim:
	@rm -rf ${HOME}/.vimrc 2> /dev/null									# Remove default config.
	@rm -rf ${HOME}/.vim 2> /dev/null									# Remove default config dir.
	@ln -s ${CONF_DIR}/vim/vimrc			${HOME}/.vimrc				# Symlink new config.
	@ln -s ${CONF_DIR}/vim					${HOME}/.vim				# Symlink new config dir.
