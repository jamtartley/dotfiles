#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

PICOM=$HOME/.config/picom
mkdir -p $PICOM
ln -sf $dir/picom.conf $PICOM
