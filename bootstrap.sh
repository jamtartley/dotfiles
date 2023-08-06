#!/usr/bin/env bash

set -e

SSH_DIR="$HOME/.ssh"
SSH_PRIVATE_KEY_NAME="id_ansible"

if ! [ -x "$(command -v ansible)" ]; then
	if [[ -f /etc/sudoers ]]; then
		sudo pacman -S ansible --noconfirm
	else
		pacman -S ansible --noconfirm
	fi
fi

if ! [[ -f "$SSH_DIR/$SSH_PRIVATE_KEY_NAME" ]]; then
	mkdir -p "$SSH_DIR"
	chmod 700 "$SSH_DIR"
	ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/$SSH_PRIVATE_KEY_NAME" -N "" -C "$USER@$HOSTNAME"
	cat "$SSH_DIR/$SSH_PRIVATE_KEY_NAME.pub" >> "$SSH_DIR/authorized_keys"
	chmod 600 "$SSH_DIR/authorized_keys"
fi

if [[ -f requirements.yml ]]; then
	ansible-galaxy install -r requirements.yml
fi

ansible-playbook --diff main.yml
