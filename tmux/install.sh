#!/usr/bin/env sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

TMUX=$HOME/.config/tmux
TMUXINATOR=$HOME/.config/tmuxinator
mkdir -p "$TMUX"
mkdir -p "$TMUXINATOR"
ln -sf "$dir/tmux.conf" "$TMUX"
ln -sf "$dir"/tmuxinator/* "$TMUXINATOR/"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
