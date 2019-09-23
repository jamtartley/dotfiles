#!/usr/bin/env bash

curl -fLo ~/.vim/autoload/plug.vim --createdirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +"PlugInstall --sync" +qa
vim +"PlugUpdate" +qa

ln -sf vimrc.symlink $HOME/.vimrc
