#!/usr/bin/env bash

sudo dnf remove xfce4-notifyd
sudo dnf install -y dunst

DUNST=$HOME/.config/dunst
mkdir -p $DUNST
ln -s $(pwd)/dunstrc $DUNST
