#!/bin/bash
echo "Installing Windows specific dotfiles first..."
# Install windows specific dotfiles
source ~/.dotfiles/install/bash/install-windows.sh
echo "Windows specific dotfiles installed."

echo "Installing Linux specific dotfiles..."
# Install linux specific dotfiles
source ~/.dotfiles/install/bash/install-linux.sh
echo "Linux specific dotfiles installed."

