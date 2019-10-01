#!/usr/bin/env bash

sudo dnf install -y feh compton

mkdir -p $HOME/.themes
wget https://github.com/EliverLara/Ant-Dracula/releases/download/v1.3.0/Ant-Dracula.tar -P $HOME/.themes
tar -xvf $HOME/.themes/Ant-Dracula.tar -C $HOME/.themes/
rm $HOME/.themes/Ant-Dracula.tar

ln -sf $(pwd)/.gtkrc-2.0.mine $HOME
