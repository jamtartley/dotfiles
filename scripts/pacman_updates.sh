#!/usr/bin/env zsh

UPDATES="$(checkupdates 2>/dev/null | sed -r '/^\s*$/d')"
UPDATE_COUNT=$(echo -n "$UPDATES" | wc -l)

if [ "$UPDATE_COUNT" -gt 0 ]; then
    echo " $UPDATE_COUNT"
else
    echo ""
fi

case $1 in
	--show) notify-send -t 5000 -a "Updates available through pacman" "$UPDATES"
	;;
esac
