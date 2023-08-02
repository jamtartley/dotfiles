#!/usr/bin/env sh

DEV_DIR="$HOME/dev"
PROJECTS=$(find /home/sam/dev -maxdepth 1 -mindepth 1 -type d | sort | awk -F '/' '{print $NF}')
CHOSEN="$(echo "$PROJECTS" | sed 's/ /\n/g' | rofi -matching fuzzy -dmenu -i -p "Select project")"
PROJECT_DIR="$DEV_DIR/$CHOSEN"

if [ -n "$CHOSEN" ]; then
	if [ -z "$1" ]; then
		# If no argument is provided, just open the terminal
		alacritty -e $SHELL -c "cd "$PROJECT_DIR"; exec $SHELL"
	else
		# If an argument is provided, execute the command and then open a new shell
		alacritty -e $SHELL -c "cd "$PROJECT_DIR"; "$1" .; exec $SHELL -l"
	fi
fi
