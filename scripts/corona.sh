#!/usr/bin/env sh

curl -s https://corona-stats.online |
  grep "World" |
  sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g ; s/║//g ; s/▲//g" |
  sed "s/\s//g ; s/|/;/g" |
  awk 'FNR == 2 {print}' |
  awk -F'│' '{print "☠" $5 " (△" $6 ")"}'
