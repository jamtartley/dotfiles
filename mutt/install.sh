#!/bin/sh

sudo pacman -S --noconfirm --needed mutt

dir="$(dirname -- "$(readlink -f -- "$0")")"

MUTT=$HOME/.config/mutt
mkdir -p $MUTT
ln -sf $dir/account.com.jamtartley.sam $MUTT
