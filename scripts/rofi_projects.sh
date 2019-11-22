#!/usr/bin/env sh

dev_dir="$HOME/dev"
projects=$(ls -A1 $dev_dir)
count=$(ls -A1 $dev_dir | wc -l)
chosen="$(ls -A1 $dev_dir | rofi -theme dracula -lines $count -dmenu -i -p "Select project")"
proj_dir="$dev_dir/$chosen"

[ -n "$chosen" ] && xterm -e "cd "$proj_dir"; $SHELL" &
