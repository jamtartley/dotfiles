#!/usr/bin/env bash

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.vimrc $HOME/.vimrc

vim +'PlugClean' +'PlugInstall --sync' +'PlugUpdate' 'OmniSharpInstall' +qa

python3 $HOME/.vim/plugged/youcompleteme/install.py --ts-completer --clang-completer --cs-completer
