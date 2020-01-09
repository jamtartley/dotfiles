#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

NEWSBOAT=$HOME/.config/newsboat
mkdir -p $NEWSBOAT
ln -sf $dir/urls $NEWSBOAT
ln -sf $dir/config $NEWSBOAT
