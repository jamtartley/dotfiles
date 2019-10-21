#!/bin/sh

sudo pacman -S --noconfirm redshift

dir="$(dirname -- "$(readlink -f -- "$0")")"

REDSHIFT=$HOME/.config/redshift
mkdir -p $REDSHIFT
ln -sf $dir/redshift.conf $REDSHIFT
