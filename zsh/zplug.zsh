#!/usr/bin/env zsh

source $HOME/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "dracula/zsh", as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load
