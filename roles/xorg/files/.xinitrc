#!/usr/bin/env bash

# needs to be set here for scripts to work in sxhkd config without specifying full path
export PATH=/home/sam/.local/bin:$PATH

setxkbmap -option caps:escape
xset r rate 350 90
xsetroot -cursor_name left_pt
xrandr --output DP-0 --mode 1920x1080 --rate 239.96

TOUCHPAD_ID=$(xinput list | rg -i 'synaptics touchpad' | awk '{print $6}' | sed 's/id=\(.*\)/\1/')
xinput set-prop $TOUCHPAD_ID "libinput Tapping Enabled" 1
xinput set-prop $TOUCHPAD_ID "libinput Accel Speed" 0.3

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if type -p bspwm >/dev/null 2>&1;
then
    exec bspwm
else
    xterm -geometry 80x24-0-0
fi

