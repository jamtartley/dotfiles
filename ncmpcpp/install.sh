#!/bin/sh

sudo pacman -S --noconfirm ncmpcpp

dir="$(dirname -- "$(readlink -f -- "$0")")"

NCMPCPP=$HOME/.config/ncmpcpp
mkdir -p $NCMPCPP
ln -sf $dir/bindings $NCMPCPP

