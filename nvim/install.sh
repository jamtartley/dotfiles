#!/bin/sh

pip install --user --upgrade pylint pynvim

NVIM=$HOME/.config/nvim
dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir $NVIM
