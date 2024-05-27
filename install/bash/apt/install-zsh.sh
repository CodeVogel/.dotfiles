#!/bin/bash
# DEPS: stow
sudo apt install zsh -y
# Stow the zsh package at the home directory
stow -d ~/.dotfiles -t ~ -S zsh
