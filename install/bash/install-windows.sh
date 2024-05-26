#!/usr/bin/env zsh
# This script is meant to be run from WSL, and will run the windows installation script as an administrator in PowerShell.

source ~/.dotfiles/install/bash/dependency-check.sh
install_dir="/home/$(whoami)/.dotfiles/install/powershell"
echo "Checking installation order for packages in $install_dir..."
check_install_order $(get_files_from_config $install_dir)


