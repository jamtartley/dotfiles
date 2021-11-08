#!/bin/sh

pip install --user --upgrade pylint pynvim

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir $NVIM
