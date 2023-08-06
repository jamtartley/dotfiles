#!/usr/bin/env bash

dir="$(dirname -- "$(readlink -f -- "$0")")"

script_dir=$HOME/.scripts
mkdir -p "$script_dir"

for f in $(find "$dir" -type f -name '*.sh');
do
    if [[ $f != *"install"* ]];
    then
        chmod +x "$f"
        ln -sf "$f" "$script_dir/$(basename "${f%.*}")"
    fi
done
