#!/usr/bin/env bash

if [[ $(uname -s) != *"Linux"* ]];
then
    exit 0
fi

#sudo dnf install -y i3 i3-gaps rofi nitrogen
#sudo cp dracula.rasi /usr/share/rofi/themes

I3=$HOME/.config/i3
mkdir -p $I3
ln -sf $(pwd)/config $I3
ln -sf $(pwd)/scripts $I3

FONTS=$HOME/.fonts
mkdir $FONTS
wget https://www.levien.com/type/myfonts/Inconsolata.otf -P FONTS
