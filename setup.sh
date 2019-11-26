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

[ -n "$(git config --global credential.helper)" ] && git config --global credential.helper 'cache --timeout=999999'

sudo groupadd -f pulse
sudo groupadd -f pulse-access
sudo usermod -aG pulse,pulse-access sam
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

sudo pacman -S --noconfirm --needed xterm pulseaudio pulseaudio-alsa neofetch playerctl keepassxc nodejs npm i3lock scrot imagemagick pavucontrol ncmpcpp ripgrep man mpc mpv youtube-dl git-lfs lib32-glu htop nvidia-settings xclip network-manager-applet shellcheck weechat xorg-xbacklight libuv fzf firefox
yay -S --noconfirm --needed google-chrome-stable unityhub

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +

chsh -s $(which zsh)
