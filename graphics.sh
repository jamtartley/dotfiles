#!/usr/bin/env sh

set -e

sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager -y --set-enabled rpmfusion-nonfree-nvidia-driver
sudo dnf config-manager -y --set-enabled rpmfusion-nonfree-steam
sudo dnf install -y steam nvidia-driver akmod-nvidia
