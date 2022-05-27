#!/usr/bin/env sh

dev_dir="$HOME/dev"
chosen="$(ls -A1 "$dev_dir" | rofi -matching fuzzy -dmenu -i -p "Open project in $1")"
proj_dir="$dev_dir/$chosen"

[ -n "$chosen" ] && alacritty -e "$SHELL" -c "cd $proj_dir; $1 ." &
