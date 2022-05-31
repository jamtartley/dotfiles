#!/usr/bin/env zsh

UPDATES=$(yay -Qum)
UPDATE_COUNT=$(echo $UPDATES | wc -l)

if [ "$UPDATE_COUNT" -gt 0 ]; then
    echo " $UPDATE_COUNT"
else
    echo ""
fi

case $1 in
	--show) notify-send -t 5000 -a "Updates available through yay" "$UPDATES"
	;;
esac
