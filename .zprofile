[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx && setxkbmap -option caps:escape
