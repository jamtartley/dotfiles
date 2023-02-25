#!/usr/bin/env bash

set -e

function set_git_user_opt() {
	key="$1"
	prompt="$2"

	if ! [[ $(git config --global "$key") ]];
	then
		read -p "$prompt: " val
		git config --global "$key" "$val"
	fi
}

function install_yay() {
	pushd "$HOME"
	rm -rf "$HOME/yay"
	git clone https://aur.archlinux.org/yay.git
	pushd yay
	makepkg -si --noconfirm --needed
	popd
	popd
}

function install_packages() {
#	sudo pacman -S --noconfirm --needed - < pacman_packages
	yay -S --noconfirm --needed - < yay_packages
}

function setup_groups() {
	sudo groupadd -f pulse
	sudo groupadd -f pulse-access
	sudo usermod -aG pulse,pulse-access "$USER"
	sudo usermod -aG wheel,docker "$USER"
}

function start_services() { 
	sudo systemctl --now enable docker.service
	sudo systemctl --now enable bluetooth.service
}

function run_module_installers() {
	find . -type f -name 'install.sh' -exec sh -c '
	for f do
		chmod +x $f
		sh -c $f
	done' sh {} +
}

# =======================================================

# set_git_user_opt "user.name" "git author"
# set_git_user_opt "user.email" "git email"
# [ -n "$(git config --global credential.helper)" ] && git config --global credential.helper store
# 
# install_yay
# install_packages
 start_services
 setup_groups
 run_module_installers
