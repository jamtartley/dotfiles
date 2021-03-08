#!/usr/bin/env sh

dev_dir="$HOME/dev"
projects=$(ls -A1 $dev_dir)
count=$(ls -A1 $dev_dir | wc -l)
chosen="$(ls -A1 $dev_dir | rofi -matching fuzzy -dmenu -i -p "Select project")"
proj_dir="$dev_dir/$chosen"

[ -n "$chosen" ] && alacritty -e $SHELL -c "cd "$proj_dir"; "$1" ." &
