all: env git gpg psql python ssh vim

# Make variables.
CONFIG_DIR:= "${HOME}/.env/config"

env:
	@chown -R $(id -u):$(id -g) ${PWD};
	rm -rf ${HOME}/.profile 												\
		${HOME}/.bashrc														\
		${HOME}/.bash_logout												\
		${HOME}/.bash_profile												\
		${HOME}/.screenrc													\
				2> /dev/null;												\
	ln -s ${CONFIG_DIR}/bash/bash_logout	${HOME}/.bash_logout;			\
	ln -s ${CONFIG_DIR}/bash/bash_profile	${HOME}/.bash_profile;			\
	ln -s ${CONFIG_DIR}/bash/bashrc			${HOME}/.bashrc;				\
	ln -s ${CONFIG_DIR}/profile				${HOME}/.profile;				\
	ln -s ${CONFIG_DIR}/screen/screenlayout ${HOME}/.screenlayout;			\
	ln -s ${CONFIG_DIR}/screen/screenrc		${HOME}/.screenrc


git:
	@rm -f ${HOME}/.gitconfig												\
		2> /dev/null;														\
	ln -s ${CONFIG_DIR}/git/gitconfig		${HOME}/.gitconfig


gpg:
	@mv ${HOME}/.gnupg						${HOME}/.gnupg.bkp				\
		2> /dev/null;														\
	cp -r ${CONFIG_DIR}/gnupg				${HOME}/.gnupg 					\
		&& chmod 0700 ${HOME}/.gnupg 										\
		&& chown -R $(id -u):$(id -g)		${HOME}/.gnupg;					\
	curl https://keys.caseyspar.kz/public.asc							|	\
		gpg --import														\
			2> /dev/null


psql:
	@ln -s ${CONFIG_DIR}/psql/psqlrc 		${HOME}/.psqlrc


python:
	@python -m ensurepip --upgrade 											\
		&& pip install 														\
			--user															\
			-r ${CONFIG_DIR}/python/requirements.txt


ssh:
	@curl https://keys.caseyspar.kz/authorized_keys						|	\
		tee ${HOME}/.ssh/authorized_keys ${HOME}/.ssh/smartcard.pub			\
		&& ssh-add ${HOME}/smartcard.pub 2> /dev/null
	


vim:
	@mv ${HOME}/.vimrc						${HOME}/.vimrc.bkp				\
		2> /dev/null;														\
	mv ${HOME}/.vim							${HOME}/.vim.bkp 				\
		2> /dev/null;														\
	ln -s ${CONFIG_DIR}/vim					${HOME}/.vim;					\
	ln -s ${CONFIG_DIR}/vim/vimrc			${HOME}/.vimrc
