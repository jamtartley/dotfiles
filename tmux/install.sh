#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

TMUX=$HOME/.config/tmux
mkdir -p "$TMUX"
ln -sf "$dir/tmux.conf" "$TMUX"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
