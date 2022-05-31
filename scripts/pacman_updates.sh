#!/usr/bin/env zsh

UPDATES="$(checkupdates)"
UPDATE_COUNT=$(echo "$UPDATES" | wc -l)

if [ "$UPDATE_COUNT" -gt 0 ]; then
    echo " $UPDATE_COUNT"
else
    echo ""
fi

case $1 in
	--show) notify-send -t 5000 -a "Updates available through pacman" "$UPDATES"
	;;
esac
