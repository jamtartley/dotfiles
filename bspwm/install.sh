#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

BSPWM=$HOME/.config/bspwm
mkdir -p $BSPWM
ln -sf $dir/bspwmrc $BSPWM
ln -sf $dir/scripts $BSPWM
