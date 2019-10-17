[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

for i in $(xinput list --id-only);
do
    xinput set-prop $i 'libinput Accel Profile Enabled' 0, 1
done

rivalcfg -s 400 -S 1600
