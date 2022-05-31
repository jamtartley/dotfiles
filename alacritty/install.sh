#!/usr/bin/env sh

dir="$(realpath .)"

ALACRITTY=$HOME/.config/alacritty
mkdir -p "$ALACRITTY"
ln -sf "$dir/alacritty.yml" "$ALACRITTY"
