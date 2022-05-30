#!/usr/bin/env zsh

source $HOME/.zplug/init.zsh
zplug "softmoth/zsh-vim-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "$HOME/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load
