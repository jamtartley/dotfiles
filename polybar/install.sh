#!/usr/bin/env bash

sudo dnf install -y @development-tools cmake gcc-c++ autoconf automake
sudo dnf install -y xcb-util-xrm-devel xcb-proto xcb-util-devel xcb-util-wm-devel xcb-util-cursor-devel xcb-util-image-devel alsa-lib-devel pulseaudio-libs-devel i3-ipc jsoncpp-devel libmpdclient-devel libcurl-devel wireless-tools-devel libnl3-devel cairo-devel

pushd /tmp
git clone --recursive https://github.com/polybar/polybar.git
pushd polybar/
sudo ./build.sh
popd
popd

dir="$(dirname -- "$(readlink -f -- "$0")")"

POLYBAR=$HOME/.config/polybar
mkdir -p $POLYBAR
mkdir -p $POLYBAR/scripts
ln -sf $dir/config $POLYBAR/
ln -sf $dir/launch.sh $POLYBAR/
ln -sf $dir/pulseaudio-control.sh $POLYBAR/scripts

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/MPlus/Regular/complete/M%2B%201mn%20Nerd%20Font%20Complete.ttf -P $HOME/.fonts
