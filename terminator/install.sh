#!/usr/bin/env sh

dir="$(realpath .)"

TERMINATOR=$HOME/.config/terminator
mkdir -p "$TERMINATOR"
ln -sf "$dir/config" "$TERMINATOR"
