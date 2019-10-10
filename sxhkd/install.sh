#!/usr/bin/env bash

sudo dnf install -y sxhkd

dir="$(dirname -- "$(readlink -f -- "$0")")"

SXHKD=$HOME/.config/sxhkd
mkdir -p $SXHKD
ln -sf $dir/sxhkdrc $SXHKD
