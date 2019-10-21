#!/usr/bin/env bash

sudo pacman -S --noconfirm wget
yay -S --noconfirm polybar

dir="$(dirname -- "$(readlink -f -- "$0")")"

POLYBAR=$HOME/.config/polybar
mkdir -p $POLYBAR
mkdir -p $POLYBAR/scripts
ln -sf $dir/config $POLYBAR/
ln -sf $dir/launch.sh $POLYBAR/
ln -sf $dir/scripts/pulseaudio-control.sh $POLYBAR/scripts
ln -sf $dir/scripts/spotify-status.py $POLYBAR/scripts

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/MPlus/Regular/complete/M%2B%201mn%20Nerd%20Font%20Complete.ttf -P $HOME/.fonts
