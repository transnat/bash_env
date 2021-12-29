all: env git gpg vim

env:
	@chown -R $(id -u):$(id -g) ${PWD};
	rm -rf ${HOME}/.profile \
		${HOME}/.bashrc \
		${HOME}/.bash_logout
		${HOME}/.screenrc \
		2> /dev/null; \
	ln -s ${PWD}/config/profile ${HOME}/.profile; \
	ln -s ${PWD}/config/bashrc ${HOME}/.bashrc; \
	ln -s ${PWD}/config/bash_logout ${HOME}/.bashrc; \
	ln -s ${PWD}/config/screen/screenrc ${HOME}/.screenrc; \
	ln -s ${PWD}/config/screenlayout ${HOME}/.screenlayout


git:
	@rm -f ${HOME}/.gitconfig 2> /dev/null; \
	ln -s ${PWD}/config/git/gitconfig ${HOME}/.gitconfig


gpg:
	@mv ${HOME}/.gnupg ${HOME}/.gnupg.bkp 2> /dev/null; \
	cp -r ${PWD}/config/gnupg ${HOME}/.gnupg && \
		chmod 0700 ${HOME}/.gnupg && \
		chown -R $(id -u):$(id -g) ${HOME}/.gnupg; \
	curl https://keys.caseyspar.kz/public.asc | \
		gpg --import \
		2> /dev/null


ssh:
	@curl https://keys.caseyspar.kz/authorized_keys >> \
		${HOME}/.ssh/authorized_keys \
		2> /dev/null


vim:
	@mv ${HOME}/.vimrc ${HOME}/.vimrc.bkp 2> /dev/null; \
	mv ${HOME}/.vim ${HOME}/.vim.bkp 2> /dev/null; \
	ln -s ${PWD}/config/vim ${HOME}/.vim; \
	ln -s ${PWD}/config/vim/vimrc ${HOME}/.vimrc
