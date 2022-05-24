#!/usr/bin/env sh

DIR="$HOME/dev/dotfiles"
FILE="$(find "$DIR" -type f | rofi -matching fuzzy -dmenu -i -p "Select config file")"

[ -n "$FILE" ] && alacritty --hold -e "$SHELL" -c "cd $DIR && vim $FILE" &
