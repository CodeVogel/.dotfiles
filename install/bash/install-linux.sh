#!/bin/bash

# Check if installation order is correct
source ~/.dotfiles/install/bash/dependency-check.sh
install_dir="/home/$(whoami)/.dotfiles/install/bash"
files_from_config=$(get_files_from_config $install_dir)

echo "Checking installation order for packages in $install_dir..."
if ! check_install_order $files_from_config; then
  echo "Installation order is incorrect; stopping now."
  exit 1
fi

# Update available packages
sudo apt update

# Install packages
for file in $files_from_config; do
  # if file starts with ./, then it is a relative path
  if [[ $file == "./"* ]]; then
    file="$install_dir/$file"
  fi
  echo "Installing $file..."
  source $file
done
