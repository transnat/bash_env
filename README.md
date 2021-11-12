# Preferred Bash Environmnt #
This repository aims to provide a portable and distro-agnostic bash environment that I can quickly pull and install on any Linux machine. Its scripts, functions, aliases and packages are ones that I find useful and enjoy having on any machine which I regularly use.

While the repository is *intended* to be portable, it should not be assumed to be in all cases. Distros I use with regularity include Debian 10, Manjaro, Arch, and Ubuntu 20.04 and are, for the most part, supported by this repository.

## Using This Repository ##
To use this repo:
* Clone it to your home directory
* Hide the directory (`mv ${HOME}/env ${HOME}/.env`)
* Run `make all`.
** Be aware that this will replace your existing `.profile`, `.bashrc`, `.screenrc`, `.vimrc`, and `.vim` directory, as well as variables such as `$SCRIPTS` and `$FUNCTIONS`, if they exist already. **It will also import my PGP pubkeys to your keyring and add my SSH key to `authorized_keys`.** Read the Makefile if you wish to only install certain components.
* Run `source ~/.profile` to load the new envoronment.

Lastly, it bears noting that certain functions, scripts, and/or aliases are useful only to me; remove them and fork the repository if you feel the urge. Additionally, some files are encrypted and therefore only usable *by* me.

## Directory Structure ##
This repository and its installation scripts add three directories to ${PATH}:
* `~/.env/scripts` (`$SCRIPTS`)
* `~/.env/functions` (`$FUNCTIONS`)
* `~/.env/gsh` (`$GSH`)

The scripts and functions directories are largely self-explanitory; the gsh directory contains PGP-encrypted scripts which are decrypted and interpreted by a bash subshell. These scripts will not be usable without the public key used to encrypt them, but you can create your own gsh scripts with the 'gshmake' script located in env/scripts.

## File Structure ##
As previously noted, running `make all` will:
* Replace the user's profile, bash, vim, and GNU screen run commands.
* `.bashrc` also loads `~/.env/aliases`, `~/.env/vars.sh`, and `~/.env/functions/*`, which set user aliases, environment variables, and bash functions respectively.
