#!/bin/sh

sudo pacman -S --noconfirm --needed sxhkd

dir="$(dirname -- "$(readlink -f -- "$0")")"

SXHKD=$HOME/.config/sxhkd
mkdir -p $SXHKD
ln -sf $dir/sxhkdrc $SXHKD
