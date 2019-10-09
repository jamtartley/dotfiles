#!/usr/bin/env bash

sudo dnf install -y redshift

REDSHIFT=$HOME/.config/redshift
mkdir -p $REDSHIFT
ln -s $(pwd)/redshift.conf $REDSHIFT
