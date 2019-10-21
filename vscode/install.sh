#!/bin/sh

yay -S --noconfirm visual-studio-code-bin
sudo pacman -S --noconfirm dotnet-runtime dotnet-sdk

dir="$(dirname -- "$(readlink -f -- "$0")")"

VSCODE=$HOME/.config/Code/User
mkdir -p $VSCODE
ln -sf $dir/settings.json $VSCODE/
ln -sf $dir/keybindings.json $VSCODE/
ln -sf $dir/snippets $VSCODE/

code --list-extensions | xargs -n 1 code --uninstall-extension
cat $dir/extensions.txt | xargs -n 1 code --install-extension
