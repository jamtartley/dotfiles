#!/usr/bin/env bash

sudo dnf remove xfce4-notifyd
sudo dnf install -y dunst

dir="$(dirname -- "$(readlink -f -- "$0")")"

DUNST=$HOME/.config/dunst
mkdir -p $DUNST
ln -sf $dir/dunstrc $DUNST
