#!/usr/bin/env sh

for battery in /sys/class/power_supply/BAT?
do
  capacity=$(cat "$battery"/capacity) || break
  status=$(sed "s/[Dd]ischarging/D/;s/[Nn]ot charging/N/;s/[Cc]harging/C/;s/[Uu]nknown/U/;s/[Ff]ull/F/" "$battery"/status)

  printf "%s%% %s"  "$capacity" "($status)"
done | sed 's/ *$//'
