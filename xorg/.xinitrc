#!/usr/bin/env bash

# needs to be set here for scripts to work in sxhkd config without specifying full path
export PATH=/home/sam/.scripts:$PATH

xrdb -load ~/.Xresources
setxkbmap -option caps:escape
xset r rate 175 60

for i in $(xinput list --id-only);
do
    xinput set-prop $i 'libinput Accel Profile Enabled' 0, 1
done

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
