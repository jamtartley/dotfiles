#!/usr/bin/env bash

scrot -o /tmp/screen.png
convert /tmp/screen.png -blur 12x4 /tmp/screen.png
[[ -f $HOME/.config/bspwm/scripts/lock.png ]] && convert /tmp/screen.png $HOME/.config/bspwm/scripts/lock.png -gravity center -composite -matte /tmp/screen.png
i3lock -e -u -i /tmp/screen.png
