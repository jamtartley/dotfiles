#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

DUNST=$HOME/.config/dunst
mkdir -p $DUNST
ln -sf $dir/dunstrc $DUNST
