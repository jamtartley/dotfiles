#!/bin/sh

pip install --user --upgrade pynvim jedi

sudo pacman -S --noconfirm --needed neovim curl
yay -S --noconfirm --needed neovim-symlinks

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dir="$(dirname -- "$(readlink -f -- "$0")")"
NVIM=$HOME/.config/nvim
mkdir -p $NVIM
ln -sf $dir/init.vim $NVIM

nvim +'PlugClean' +'PlugInstall --sync' +'PlugUpdate' +qa
