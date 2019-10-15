#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.Xresources $HOME
ln -sf $dir/.xinitrc $HOME
