#!/bin/sh

yay -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed dotnet-runtime dotnet-sdk mono

dir="$(dirname -- "$(readlink -f -- "$0")")"

VSCODE=$HOME/.config/Code/User
mkdir -p $VSCODE
ln -sf $dir/settings.json $VSCODE/
ln -sf $dir/keybindings.json $VSCODE/
ln -sf $dir/snippets $VSCODE/

code --list-extensions | xargs -n 1 code --uninstall-extension
cat $dir/extensions.txt | xargs -n 1 code --install-extension
