#!/usr/bin/env sh

DIR="$HOME/dev/.dotfiles"
FILE="$(find "$DIR" -type f | rofi -theme dracula -matching fuzzy -lines 10 -dmenu -i -p "Select config file")"

[ -n "$FILE" ] && xterm -e "vim $FILE" &
