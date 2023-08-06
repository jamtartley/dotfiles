#!/usr/bin/env sh

rofi -dmenu -lines 0 -p "YouTube search: " | xargs -I{} google-chrome-stable --incognito --new-window "youtube.com/results?search_query={}"
