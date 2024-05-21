#!/bin/bash
# DEPS: 
# apt update
# stow

sudo apt install zsh -y

# Change default shell to zsh
chsh -s $(which zsh) 
# Set dotfiles location for zsh
export ZDOTDIR=~/.dotfiles/zsh

# Stow the zsh package at the home directory
stow -d ~/.dotfiles -t ~ -S zsh
