#!/bin/sh

pip install --user --upgrade pylint pynvim

sudo pacman -S --noconfirm --needed neovim curl npm
yay -S --noconfirm --needed neovim-symlinks

sudo npm install -H -g follow-redirects

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dir="$(dirname -- "$(readlink -f -- "$0")")"
NVIM=$HOME/.config/nvim
mkdir -p $NVIM
ln -sf $dir/init.vim $NVIM
ln -sf $dir/coc-settings.json $NVIM

nvim +'PlugClean' +'PlugInstall --sync' +'PlugUpdate' +qa
