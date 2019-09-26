#!/usr/bin/env bash

sudo dnf install -y i3 i3-gaps rofi nitrogen

I3=$HOME/.config/i3
mkdir -p $I3
ln -sf $(pwd)/config $I3
ln -sf $(pwd)/scripts $I3

sudo mkdir -p /usr/share/rofi/themes
ln -sf $(pwd)/dracula.rasi /usr/share/rofi/themes

FONTS=$HOME/.fonts
mkdir $FONTS
wget https://www.levien.com/type/myfonts/Inconsolata.otf -P FONTS
