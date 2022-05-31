#!/usr/bin/env zsh

UPDATES=$(yay -Qum | sed -r '/^\s*$/d')
UPDATE_COUNT=$(echo -n $UPDATES | wc -l)

if [ "$UPDATE_COUNT" -gt 0 ]; then
    echo " $UPDATE_COUNT"
else
    echo ""
fi

case $1 in
	--show) notify-send -t 5000 -a "Updates available through yay" "$UPDATES"
	;;
esac
