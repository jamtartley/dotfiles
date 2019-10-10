#!/usr/bin/env bash

sudo dnf install -y vim cmake gcc-c++ make python3-devel

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugClean' +'PlugInstall --sync' +'PlugUpdate' 'OmniSharpInstall' +qa

python3 $HOME/.vim/plugged/youcompleteme/install.py --ts-completer --clang-completer --cs-completer

ln -sf $(pwd)/.vimrc $HOME/.vimrc
