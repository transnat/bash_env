all: env git gpg vim

env:
	@chown -R $(id -u):$(id -g) ${HOME}/env && \
					mv ${HOME}/env ${HOME}/.env && \
					rm -rf ${HOME}/.profile \
						${HOME}/.bashrc \
						${HOME}/.screenrc && \
					ln -s ${HOME}/.env/config/profile ${HOME}/.profile; \
					ln -s ${HOME}/.env/config/bashrc ${HOME}/.bashrc; \
					ln -s ${HOME}/.env/config/screen/screenrc ${HOME}/.screenrc; \
					ln -s ${HOME}/.env/config/screenlayout ${HOME}/.screenlayout

git:
	@rm ${HOME}/.gitconfig && \
					ln -s ${HOME}/.env/config/git/gitconfig ${HOME}/.gitconfig


gpg:
	@mv ${HOME}/.gnupg ${HOME}/.gnupg.bkp && \
					cp -r ${HOME}/.env/config/gnupg ${HOME}/.gnupg && \
					chown -R $(id -u):$(id -g) ${HOME}/.gnupg

vim:
	@rm -rf ${HOME}/.vimrc \
					${HOME}/.vim && \
					ln -s ${HOME}/.env/config/vim ${HOME}/.vim; \
					ln -s ${HOME}/.env/config/vim/vimrc ${HOME}/.vimrc
