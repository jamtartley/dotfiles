#!/usr/bin/env sh

[ "$(stat -c %y ~/.cache/corona | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] &&
  curl -s https://corona-stats.online > ~/.cache/corona

grep "World" ~/.cache/corona |
  sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g ; s/║//g ; s/▲//g" |
  sed "s/\s//g ; s/|/;/g" |
  awk 'FNR == 2 {print}' |
  awk -F'│' '{print "☠" $5 " (△" $6 ")"}'
