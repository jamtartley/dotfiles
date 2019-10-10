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

sudo dnf install -y python htop qutebrowser xterm
sudo pip3 install --upgrade taggregator

sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install ffmpeg

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.profile $HOME

git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer;
do
    chmod +x $installer
    sh -c "$installer"
done
