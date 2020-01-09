#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

dir="$(dirname -- "$(readlink -f -- "$0")")"

ln -sf $dir/.zshrc $HOME/.zshrc
