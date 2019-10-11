#!/usr/bin/env bash

set -e

sym_file() {
 if [ -e "$2" ];
 then
     if [ "$(readlink "$2")" = "$1" ];
     then
         return 0
     fi
 fi

 ln -sf "$1" "$2"
}

if [[ $(uname -s) != *"Linux"* ]];
then
 if [[ $(lsb_release -is) != *"Fedora"* ]];
 then
     echo "Only supporting Fedora at the minute..."
     exit 0
 fi
fi

sudo dnf install -y @development-tools cmake gcc-c++ autoconf automake
sudo dnf install -y xcb-util-xrm-devel xcb-proto xcb-util-devel xcb-util-wm-devel xcb-util-cursor-devel xcb-util-image-devel alsa-lib-devel pulseaudio-libs-devel i3-ipc jsoncpp-devel libmpdclient-devel libcurl-devel wireless-tools-devel libnl3-devel cairo-devel
sudo dnf install -y python pulseaudio pavucontrol htop qutebrowser firefox xterm
sudo dnf install -y pulseaudio pulseaudio-utils alsa-utils
sudo dnf install -y bspwm i3lock
sudo dnf remove xfce4-notifyd
sudo dnf install -y dunst libnotify
sudo dnf install -y redshift
sudo dnf install -y sxhkd
sudo dnf install -y vim cmake gcc-c++ make python3-devel nodejs
sudo dnf install -y @base-x
sudo dnf install -y zsh util-linux-user

sudo usermod -aG pulse,pulse-access sam
pip3 install --user taggregator

sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install ffmpeg

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.zprofile $HOME

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +
