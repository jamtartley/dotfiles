#!/usr/bin/env bash

sudo dnf install -y bspwm i3lock

BSPWM=$HOME/.config/bspwm
mkdir -p $BSPWM
ln -sf $(pwd)/bspwmrc $BSPWM
ln -sf $(pwd)/scripts $BSPWM
