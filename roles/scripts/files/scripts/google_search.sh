#!/usr/bin/env sh

rofi -dmenu -lines 0 -p "Google search: " | xargs -I{} google-chrome-stable --incognito --new-window "google.com/search?q={}"
