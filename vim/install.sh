#!/usr/bin/env bash

if [[ $(uname -s) == *"Linux"* ]];
then
    echo "Installing vim..."
    sudo $PACKAGE_MANAGER install vim
fi

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa
