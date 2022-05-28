#!/usr/bin/env sh

TMUXINATOR_PROJECTS=$(tmuxinator list | tail -1 | tr -s '[:space:]' '\n')
CHOSEN="$(echo "$TMUXINATOR_PROJECTS" | rofi -matching fuzzy -dmenu -i -p "Select tmuxinator project")"

[ -n "$CHOSEN" ] && alacritty -e "$SHELL" -c "tmuxinator start $CHOSEN" &
