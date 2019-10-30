#!/usr/bin/env sh

[ "$(printf "No\\nYes" | rofi -theme dracula -lines 2 -dmenu -i -p "$1")" = "Yes" ] && $2
