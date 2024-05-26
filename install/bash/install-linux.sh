#!/bin/bash

# Update available packages
sudo apt update

source ~/.dotfiles/install/bash/dependency-check.sh

# Check if installation order is correct
install_dir="/home/$(whoami)/.dotfiles/install/bash"
files_from_config=$(get_files_from_config $install_dir)

echo "Checking installation order for packages in $install_dir..."
if ! check_install_order $files_from_config; then
  echo "Installation order is incorrect; stopping now."
  exit 1
fi
