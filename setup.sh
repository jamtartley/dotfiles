#!/usr/bin/env bash

set -e

# sym_file() {
#     if [ -e "$2" ];
#     then
#         if [ "$(readlink "$2")" = "$1" ];
#         then
#             return 0
#         fi
#     fi

#     ln -sf "$1" "$2"
# }

# sym_dots() {
#     find -H "$(pwd -P)" -maxdepth 3 -name "*.symlink" -not -path "*.git" |
#         while read -r src;
#         do
#             dest="$HOME/.$(basename "${src%.*}")"
#             sym_file "$src" "$dest"
#         done
#     }

# if [[ $(uname -s) != *"Linux"* ]];
# then
#     if [[ $(lsb_release -is) != *"Fedora"* ]];
#     then
#         echo "Only supporting Fedora at the minute..."
#         exit 0
#     fi
# fi

# sym_dots

# sudo dnf install -y python3
# sudo pip3 install --upgrade taggregator

# bash -c "$(wget -q0- https://git.io/vQgMr)"

FONTS=$HOME/.fonts
mkdir -p $FONTS
pushd $FONTS
# wget https://www.levien.com/type/myfonts/Inconsolata.otf -P $FONTS
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip master.zip
mv YosemiteSanFranciscoFont-master/*.ttf $FONTS
rm -rf YosemiteSanFranciscoFont-master master.zip
popd

# ln -sf $(pwd)/.profile $HOME

# git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer;
# do
#     chmod +x $installer
#     sh -c "$installer"
# done
