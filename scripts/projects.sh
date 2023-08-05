#!/bin/bash

DEV_DIR="$HOME/dev"
PROJECTS=$(find /home/sam/dev -maxdepth 1 -mindepth 1 -type d | sort | awk -F '/' '{print $NF}')
PROJECT="$(echo "$PROJECTS" | sed 's/ /\n/g' | rofi -matching fuzzy -dmenu -i -p "Select project")"

if [ -n "$PROJECT" ]; then
  alacritty -e tmux new-session -c "$DEV_DIR/$PROJECT"
fi
