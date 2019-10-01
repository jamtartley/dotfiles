#!/usr/bin/env bash

sudo dnf install -y i3 i3-gaps rofi
sudo dnf copr enable -y gregw/i3desktop
sudo dnf install -y i3-gaps

I3=$HOME/.config/i3
mkdir -p $I3
ln -sf $(pwd)/config $I3
ln -sf $(pwd)/wallpaper.png $I3
ln -sf $(pwd)/scripts $I3

sudo mkdir -p /usr/share/rofi/themes
sudo ln -sf $(pwd)/dracula.rasi /usr/share/rofi/themes
