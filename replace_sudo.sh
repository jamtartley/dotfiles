#!/usr/bin/env bash

delete_sudo() {
  sed -i 's/sudo//g' $1
}

delete_sudo ./setup.sh

for f in $(find . -type f -name 'install.sh'); do
  delete_sudo $f
done