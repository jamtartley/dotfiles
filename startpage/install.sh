#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

STARTPAGE=$HOME/.config/startpage
mkdir -p $STARTPAGE
ln -sf $dir/index.html $STARTPAGE
ln -sf $dir/index.js $STARTPAGE
ln -sf $dir/styles.css $STARTPAGE
