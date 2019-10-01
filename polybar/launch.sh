killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main &

if type "xrandr" > /dev/null;
then
    for mon in $(xrandr --query | grep " connected" | cut -d " " -f1);
    do
        MONITOR=$mon polybar --reload main -c $HOME/.config/polybar/config &
    done
fi

echo "Polybar launched..."
