#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

NCMPCPP=$HOME/.config/ncmpcpp
mkdir -p $NCMPCPP
ln -sf $dir/bindings $NCMPCPP
