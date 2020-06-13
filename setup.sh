#!/usr/bin/env sh

set -e

set_git_user_opt() {
    key="$1"
    prompt="$2"

    if ! [[ $(git config --global "$key") ]];
    then
        read -p "$prompt: " val
        git config --global $key "$val"
    fi
}

set_git_user_opt "user.name" "git author"
set_git_user_opt "user.email" "git email"
[ -n "$(git config --global credential.helper)" ] && git config --global credential.helper store

sudo groupadd -f pulse
sudo groupadd -f pulse-access
sudo usermod -aG pulse,pulse-access $USER
sudo pacman -S --noconfirm --needed python python2 python-pip python2-pip python-dbus

pushd $HOME
rm -rf $HOME/yay
git clone https://aur.archlinux.org/yay.git
pushd yay
makepkg -si --noconfirm --needed
popd
popd

pip3 install --user taggregator
sudo pip install hidapi rivalcfg

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.zprofile $HOME

sudo pacman -S --noconfirm --needed - < pacman_packages
yay -S --noconfirm --needed - < yay_packages

ln -sf $(pwd)/post-commit $(pwd)/.git/hooks

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +

sudo systemctl --now enable docker.service
sudo usermod -aG wheel,docker $USER

sudo systemctl --now enable bluetooth.service

pushd $HOME
dotnet tool install -g dotnet-format
popd
