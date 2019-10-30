#!/usr/bin/env sh

sudo pacman -S --noconfirm --needed dunst

dir="$(dirname -- "$(readlink -f -- "$0")")"

DUNST=$HOME/.config/dunst
mkdir -p $DUNST
ln -sf $dir/dunstrc $DUNST
