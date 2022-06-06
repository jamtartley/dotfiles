#!/usr/bin/env sh

DEV_DIR="$HOME/dev"
PROJECTS=$(find /home/sam/dev -maxdepth 1 -mindepth 1 -type d | sort | awk -F '/' '{print $NF}')
CHOSEN="$(echo "$PROJECTS" | sed 's/ /\n/g' | rofi -matching fuzzy -dmenu -i -p "Select project")"
PROJECT_DIR="$DEV_DIR/$CHOSEN"

[ -n "$CHOSEN" ] && alacritty -e "$SHELL" -c "tmux -2 new-session -c $PROJECT_DIR" &
