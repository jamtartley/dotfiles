#!/usr/bin/env sh

base_url="https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=es&dt=t&q="
ua='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36'
qry=$( rofi -dmenu -lines 0 -p "Spanish translate: " | sed -e "s/\ /+/g" )
full_url=${base_url}${qry}
response=$(curl -sA "${ua}" "${full_url}" | jq -r '.[0][0][0]')
notify-send -u low -t 3000 "$response"
