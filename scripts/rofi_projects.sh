#!/usr/bin/env sh

dev_dir=$HOME/dev
chosen="$(ls -1 $dev_dir | rofi -theme dracula -dmenu -p "Select project")"
proj_dir="$dev_dir/$chosen"

[ -n "$chosen" ] && xterm -e "cd "$proj_dir"; $SHELL" &
