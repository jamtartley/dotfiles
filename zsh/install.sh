#!/usr/bin/env bash

os=$(uname -s)

if [[ "$os" == *"Linux"* ]]; then
    sudo dnf install zsh
fi

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
