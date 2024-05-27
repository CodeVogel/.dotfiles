#!/bin/bash
# deps: homebrew, stow
brew install neovim -y
stow -d $HOME/.dotfiles/ -t $HOME -S neovim
