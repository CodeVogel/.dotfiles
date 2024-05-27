#!/bin/bash
# deps: homebrew, stow
brew install neovim
stow -d $HOME/.dotfiles/ -t $HOME -S neovim
