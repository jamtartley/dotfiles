#!/usr/bin/env sh

LOCATION_PATH="$HOME/.cache/corona_location"

[ ! -f "$LOCATION_PATH" ] && echo "true" > "$LOCATION_PATH"

watch() {
  output
  inotifywait -qm --event modify "$LOCATION_PATH" | {
    while read;
      do
        output
    done
  }
}

output() {
  case "$(cat "$LOCATION_PATH")" in
    true) HEADER="UK" ;;
    false) HEADER="World" ;;
  esac

  curl -s https://corona-stats.online |
    grep $HEADER |
    tail -1 |
    sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g ; s/║//g ; s/▲//g" |
    sed "s/\s//g ; s/|/;/g" |
    awk -v header=$HEADER -F'│' '{print "☠" $5 " △" (match($6, /[^$]/) ? $6 : 0) " (" header ")"}'
}

case "$1" in
  --toggle)
    if [ "$(cat "$LOCATION_PATH")" = "true" ]
    then
      echo "false" > "$LOCATION_PATH"
    else
      echo "true" > "$LOCATION_PATH"
    fi
    ;;
  *) watch ;;
esac
