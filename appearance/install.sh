#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

mkdir -p $HOME/.themes
wget https://github.com/EliverLara/Ant-Dracula/releases/download/v1.3.0/Ant-Dracula.tar -P $HOME/.themes
tar -xvf $HOME/.themes/Ant-Dracula.tar -C $HOME/.themes/
rm $HOME/.themes/Ant-Dracula.tar

FONTS=$HOME/.fonts
mkdir -p $FONTS
ln -sf $dir/fonts/* $FONTS

wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

sudo mkdir -p /usr/share/rofi/themes
sudo ln -sf $dir/dracula.rasi /usr/share/rofi/themes

wallpaper_dir="$HOME/Pictures/Wallpapers"
mkdir -p $wallpaper_dir
ln -sf $dir/wallpapers $wallpaper_dir

cp $dir/.gtkrc-2.0 $HOME
ln -sf $dir/.gtkrc-2.0 $HOME
ln -sf $dir/.gtkrc-2.0.mine $HOME
