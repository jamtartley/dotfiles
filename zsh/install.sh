#!/bin/sh

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

dir="$(dirname -- "$(readlink -f -- "$0")")"

ln -sf $dir/.zshrc $HOME/.zshrc
mkdir -p $HOME/.zsh
ln -sf $dir/*.zsh $HOME/.zsh
