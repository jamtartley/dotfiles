#!/bin/bash

DEV_DIR="$HOME/dev"
PROJECTS=$(ls "$DEV_DIR")
PROJECT=$(echo "$PROJECTS" | rofi -dmenu -p "Select a file: ")

if [ -n "$PROJECT" ]; then
  alacritty -e tmux new-session -c "$DEV_DIR/$PROJECT"
fi
