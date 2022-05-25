#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

POLYBAR="$HOME/.config/polybar"
mkdir -p "$POLYBAR"
ln -sf "$dir/config.ini" $POLYBAR/
ln -sf "$dir/launch.sh" $POLYBAR/
