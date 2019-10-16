#!/bin/sh

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
sudo dnf -y install code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/30/prod.repo

sudo dnf update -y
sudo dnf install -y dotnet-sdk-3.0

dir="$(dirname -- "$(readlink -f -- "$0")")"

VSCODE=$HOME/.config/Code/User
mkdir -p $VSCODE
ln -sf $dir/settings.json $VSCODE/
ln -sf $dir/keybindings.json $VSCODE/
ln -sf $dir/snippets $VSCODE/

code --list-extensions | xargs -n 1 code --uninstall-extension
cat $dir/extensions.txt | xargs -n 1 code --install-extension
