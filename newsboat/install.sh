#!/bin/sh

sudo pacman -S --noconfirm --needed newsboat

dir="$(dirname -- "$(readlink -f -- "$0")")"

NEWSBOAT=$HOME/.config/newsboat
mkdir -p $NEWSBOAT
ln -sf $dir/urls $NEWSBOAT
ln -sf $dir/config $NEWSBOAT
