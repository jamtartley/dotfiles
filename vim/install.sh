#!/bin/sh

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.vimrc $HOME/.vimrc

vim -u NONE +'PlugClean' +'PlugInstall --sync' +'PlugUpdate' +qa
