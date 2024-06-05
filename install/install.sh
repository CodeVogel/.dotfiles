#!/bin/bash
echo "🗨️ Installing dotfiles and setting up environment..."
echo "🗨️ This script will ask you for sudo access once to install some packages."
echo "🗨️ It will install Windows related dotfiles first and then Linux related dotfiles."
echo "🗨️ After entering your sudo password, wait for the first UAC prompt to appear (this launches PowerShell as an administrator)."
echo "🗨️ After that, the installation should proceed automatically."
echo "🗨️ The installation may ask for input if it encounters any already existing files."
echo "🗨️ Typically, that only happens if you have already installed dotfiles before."
echo "🗨️ The installation may ask for input if it encounters any already existing files."
echo "❗Asking for sudo access..."
sudo echo "🗨️ Sudo access granted."
echo "🗨️ Installing Windows specific dotfiles first..."
# Install windows specific dotfiles
source ~/.dotfiles/install/bash/install-windows.sh
echo "🗨️ Windows specific dotfiles installed."

echo "🗨️ Installing Linux specific dotfiles..."
# Install linux specific dotfiles
source ~/.dotfiles/install/bash/install-linux.sh
echo "🗨️ Linux specific dotfiles installed."
