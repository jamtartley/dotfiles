#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.Xresources $HOME/.Xresources
ln -sf $dir/.xinitrc $HOME/.xinitrc
