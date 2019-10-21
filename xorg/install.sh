#!/bin/sh

sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xrandr

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.Xresources $HOME
ln -sf $dir/.xinitrc $HOME
