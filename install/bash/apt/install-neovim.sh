#!/bin/bash
# deps: stow
sudo apt-get install neovim -y
stow -d $HOME/.dotfiles/ -t $HOME -S neovim
