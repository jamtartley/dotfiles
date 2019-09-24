#!/usr/bin/env bash

if [[ $(uname -s) == *"Linux"* ]];
then
    echo "Installing vim..."
    sudo $PACKAGE_MANAGER install vim

    if [[ $PACKAGE_MANAGER == "dnf" ]]
    then
        sudo dnf install cmake gcc-c++ make python3-devel
    elif [[ $PACKAGE_MANAGER == "apt-get" ]]
    then
        sudo apt-get install build-essential cmake python3-dev
    fi
fi

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

python3 $HOME/.vim/plugged/youcompleteme/install.py --ts-completer --clang-completer
