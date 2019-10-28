#!/usr/bin/env bash

xrdb -load ~/.Xresources
setxkbmap -option caps:escape

for i in $(xinput list --id-only);
do
    xinput set-prop $i 'libinput Accel Profile Enabled' 0, 1
done

rivalcfg -s 400 -S 1600

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
