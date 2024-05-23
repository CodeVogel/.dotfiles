#!/bin/bash
# DEPS: stow

sudo apt install zsh -y

# Change default shell to zsh
me=$(whoami)
sudo chsh -s $(which zsh) $me

# Set dotfiles location for zsh
export ZDOTDIR=~/.dotfiles/zsh

# Stow the zsh package at the home directory
stow -d ~/.dotfiles -t ~ -S zsh
