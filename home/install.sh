#!/usr/bin/env sh

dir="$(realpath .)"

find "$dir" -type f -not -name "install.sh" -exec sh -c '
for f do
	ln -sf $f $HOME
done' sh {} +
