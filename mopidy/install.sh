#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

MOPIDY=$HOME/.config/mopidy
mkdir -p $MOPIDY
[ ! -e $MOPIDY/mopidy.conf ] && cp $dir/mopidy.conf $MOPIDY
