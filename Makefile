all: env git gpg psql python ssh vim

# Make variables.
CONFIG:= "${HOME}/.env/config"

env:
	@chown -R $(id -u):$(id -g) ${PWD};
	rm -rf ${HOME}/.profile 										\
			${HOME}/.bashrc											\
			${HOME}/.bash_logout									\
			${HOME}/.bash_profile									\
			${HOME}/.screenrc										\
		2> /dev/null;												\
	ln -s ${CONFIG}/profile				${HOME}/.profile;			\
	ln -s ${CONFIG}/bash/bashrc			${HOME}/.bashrc;			\
	ln -s ${CONFIG}/bash/bash_logout	${HOME}/.bash_logout;		\
	ln -s ${CONFIG}/bash/bash_profile	${HOME}/.bash_profile;		\
	ln -s ${CONFIG}/screen/screenrc		${HOME}/.screenrc;			\
	ln -s ${CONFIG}/screen/screenlayout ${HOME}/.screenlayout


git:
	@rm -f ${HOME}/.gitconfig										\
		2> /dev/null;												\
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig


gpg:
	@mv ${HOME}/.gnupg					${HOME}/.gnupg.bkp			\
		2> /dev/null;												\
	cp -r ${CONFIG}/gnupg				${HOME}/.gnupg &&			\
		chmod 0700 ${HOME}/.gnupg &&								\
		chown -R $(id -u):$(id -g)		${HOME}/.gnupg;				\
	curl https://keys.caseyspar.kz/public.asc |						\
		gpg --import												\
		2> /dev/null


psql:
	@ln -s ${CONFIG}/psql/psqlrc 		${HOME}/.psqlrc


python:
	@python -m ensurepip --upgrade &&								\
		pip install --user -r ${CONFIG}/python/requirements.txt


ssh:
	@curl https://keys.caseyspar.kz/authorized_keys | tee			\
			${HOME}/.ssh/authorized_keys							\
			${HOME}/.ssh/5Ci_01.pub									\
		2> /dev/null


vim:
	@mv ${HOME}/.vimrc ${HOME}/.vimrc.bkp 							\
		2> /dev/null;												\
	mv ${HOME}/.vim ${HOME}/.vim.bkp								\
		2> /dev/null;												\
	ln -s ${CONFIG}/vim					${HOME}/.vim;				\
	ln -s ${CONFIG}/vim/vimrc			${HOME}/.vimrc
