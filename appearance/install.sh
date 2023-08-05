#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

mkdir -p "$HOME/.themes"
wget https://github.com/dracula/gtk/releases/download/v3.0/Dracula.tar.xz -P "$HOME/.themes"
tar -xvf "$HOME/.themes/Dracula.tar.xz" -C "$HOME/.themes/"
rm "$HOME/.themes/Dracula.tar.xz"

wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

sudo mkdir -p /usr/share/rofi/themes
mkdir "$HOME/.config/rofi"
ln -sf "$dir/config.rasi" "$HOME/.config/rofi"
sudo ln -sf "$dir/config.rasi" /usr/share/rofi/themes

cp "$dir/.gtkrc-2.0" "$HOME"
ln -sf "$dir/.gtkrc-2.0" "$HOME"
ln -sf "$dir/.gtkrc-2.0.mine" "$HOME"
