#!/usr/bin/env bash

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update
sudo dnf install code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/30/prod.repo

sudo dnf update -y
sudo dnf install -y dotnet-sdk-3.0

VSCODE=$HOME/.config/Code/User
mkdir -p $VSCODE
ln -sf $(pwd)/settings.json $VSCODE/
ln -sf $(pwd)/keybindings.json $VSCODE/
ln -sf $(pwd)/snippets $VSCODE/

code --list-extensions | xargs -n 1 code --uninstall-extension
cat $(pwd)/extensions.txt | xargs -n 1 code --install-extension
