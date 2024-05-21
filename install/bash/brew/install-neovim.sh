#!/bin/bash
# deps: brew, stow
brew install neovim -y 
stow -d $HOME/.dotfiles/ -t $HOME -S neovim
