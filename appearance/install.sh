#!/usr/bin/env bash

sudo dnf install -y feh compton

mkdir -p $HOME/.themes
wget https://github.com/EliverLara/Ant-Dracula/releases/download/v1.3.0/Ant-Dracula.tar -P $HOME/.themes
tar -xvf $HOME/.themes/Ant-Dracula.tar -C $HOME/.themes/
rm $HOME/.themes/Ant-Dracula.tar

FONTS=$HOME/.fonts
mkdir -p $FONTS
pushd $FONTS
wget https://www.levien.com/type/myfonts/Inconsolata.otf -P $FONTS
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip master.zip
mv YosemiteSanFranciscoFont-master/*.ttf $FONTS
rm -rf YosemiteSanFranciscoFont-master master.zip
popd

wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

sudo mkdir -p /usr/share/rofi/themes
sudo ln -sf $(pwd)/dracula.rasi /usr/share/rofi/themes

ln -sf $(pwd)/.gtkrc-2.0.mine $HOME
ln -sf $(pwd)/.Xresources $HOME
ln -sf $(pwd)/wallpaper.jpg $HOME

xrdb $HOME/.Xresources