#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

mkdir -p "$HOME/.themes"
wget https://github.com/EliverLara/Ant-Dracula/releases/download/v1.3.0/Ant-Dracula.tar -P "$HOME/.themes"
tar -xvf "$HOME/.themes/Ant-Dracula.tar" -C "$HOME/.themes/"
rm "$HOME/.themes/Ant-Dracula.tar"

wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

sudo mkdir -p /usr/share/rofi/themes
mkdir "$HOME/.config/rofi"
ln -sf "$dir/config.rasi" "$HOME/.config/rofi"
ln -sf "$dir/dracula.rasi" "$HOME/.config/rofi"
sudo ln -sf "$dir/config.rasi" /usr/share/rofi/themes

wallpaper_dir="$HOME/Pictures/Wallpapers"
mkdir -p "$wallpaper_dir"
ln -sf $"dir/wallpapers" "$wallpaper_dir"

cp "$dir/.gtkrc-2.0" "$HOME"
ln -sf "$dir/.gtkrc-2.0" "$HOME"
ln -sf "$dir/.gtkrc-2.0.mine" "$HOME"

sudo chmod 777 /opt/spotify -R
spicetify backup apply enable-devtool
