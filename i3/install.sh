#!/usr/bin/env bash

sudo dnf install -y i3 rofi xorg-x11-util-macros
sudo dnf copr enable -y gregw/i3desktop
sudo dnf install -y i3-gaps
sudo pip install i3-py

I3=$HOME/.config/i3
mkdir -p $I3
ln -sf $(pwd)/config $I3
ln -sf $(pwd)/alternating_layouts.py $I3
ln -sf $(pwd)/wallpaper.png $I3
ln -sf $(pwd)/scripts $I3

sudo mkdir -p /usr/share/rofi/themes
sudo ln -sf $(pwd)/dracula.rasi /usr/share/rofi/themes
