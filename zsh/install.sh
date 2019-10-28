#!/bin/sh

sudo pacman -S --noconfirm --needed zsh curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

dir="$(dirname -- "$(readlink -f -- "$0")")"

ln -sf $dir/.zshrc $HOME/.zshrc
