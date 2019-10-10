#!/usr/bin/env bash

sudo dnf install -y @base-x

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.Xresources $HOME/.Xresources
ln -sf $dir/.xinitrc $HOME/.xinitrc
