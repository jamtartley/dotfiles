#!/usr/bin/env bash

if [[ $(uname -s) != *"Linux"* ]];
then
    exit 0
fi

#sudo dnf install -y @development-tools cmake gcc-c++ autoconf automake$
#sudo dnf install -y xcb-util-xrm-devel xcb-proto xcb-util-devel xcb-uti    l-wm-devel xcb-util-cursor-devel xcb-util-image-devel alsa-lib-devel pu    lseaudio-libs-devel i3-ipc jsoncpp-devel libmpdclient-devel libcurl-dev    el wireless-tools-devel libnl3-devel cairo-devel $
pushd /tmp
git clone --recursive https://github.com/polybar/polybar.git
pushd polybar/
sudo ./build.sh
popd
popd

POLYBAR=$HOME/.config/polybar
mkdir -p $POLYBAR
ln -s $(pwd)/config $POLYBAR/
ln -s $(pwd)/launch.sh $POLYBAR/

wget https://osdn.net/projects/mplus-fonts/downloads/62344/mplus-TESTFLIGHT-063.tar.xz -P $HOME/.fonts
tar -xf $HOME/.fonts/mplus-TESTFLIGHT-063.tar.xz -C $HOME/.fonts
