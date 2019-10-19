#!/usr/bin/env sh

set -e

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.zprofile $HOME

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +

exit 0

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

read -r -p "git author: " git_author
read -p "git email: " git_email
git config --global user.name "$git_author"
git config --global user.email "$git_email"
git config --global credential.helper cache

sudo dnf install -y `cat $(pwd)/packages`

sudo ln -sf /var/lib/snapd/snap /snap

sudo hostnamectl set-hostname jamtartley

sudo usermod -aG pulse,pulse-access sam
pip3 install --user taggregator hidapi rivalcfg

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.zprofile $HOME

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +
