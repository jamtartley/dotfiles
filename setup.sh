#!/usr/bin/env bash

set -e

sym_file() {
    if [ -e "$2" ];
    then
        if [ "$(readlink "$2")" = "$1" ];
        then
            return 0
        fi
    fi

    ln -sf "$1" "$2"
}

sym_dots() {
    find -H "$(pwd -P)" -maxdepth 3 -name "*.symlink" -not -path "*.git" |
        while read -r src;
        do
            dest="$HOME/.$(basename "${src%.*}")"
            sym_file "$src" "$dest"
        done
    }

sym_dots

git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer;
do
    chmod +x $installer
    sh -c "$installer"
done
