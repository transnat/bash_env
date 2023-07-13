# Environment
This role makes minor changes to userspace, implementing my preferred user environment, including my scripts, rc
files and configs, and CA certificates.

## Tasks
### [Bash](./tasks/bash.yml)
Creates symlinks to the following [files](./files/)
* `~/.profile`
* `~/.bash/`
* `~/.bashrc`
* `~/.bash_logout`

Creates ~/.bashrc.local, for bash run-commands that should **not** exist in this Git repository.

### [CA Certificates](./tasks/ca_certificates.yml)
Imports and installs my public CA certificates.

### [Config Files](./tasks/dotfiles.yml)
Symlinks portable and non-sensitive dotfiles to `~/.config`.

### [Git](./tasks/git.yml)
Symlinks `~/.gitconfig`.

### [GnuPG](./tasks/gnupg.yml)
Creates `~/.gnupg/` and copys in:
* My public key.
* `gpg.conf`
* `gpg-agent.conf`

### [Gnu Screen](./tasks/screen.yml)
Symlinks `~/.screenrc`.

### [Scripts](./tasks/script_dir.yml)
Creates `~/.local/lib/` and symlinks `~/.local/lib/scripts`.

### [SSH](./tasks/ssh.yml)
Creates `~/.ssh/` and copies:
* My public key.
* `~/.ssh/config`

### [Vim](./tasks/vim.yml)
Symlinks:
* `~/.vimrc`
* `~/.vim`
