#!/usr/bin/env bash

xrdb -load ~/.Xresources

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

setxkbmap -option caps:escape
