#!/usr/bin/env bash

if [[ $(uname -s) == *"Linux"* ]];
then
    echo "Installing zsh..."
    sudo $PACKAGE_MANAGER install zsh
fi

#zsh comes as standard on MacOS

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
