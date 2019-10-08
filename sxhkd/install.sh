#!/usr/bin/env bash

sudo dnf install -y sxhkd

SXHKD=$HOME/.config/sxhkd
mkdir -p $SXHKD
ln -sf $(pwd)/sxhkdrc $SXHKD
