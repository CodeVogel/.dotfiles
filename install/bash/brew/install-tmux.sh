#!/bin/bash
# deps: homebrew, stow
brew install tmux
stow -d $HOME/.dotfiles/ -t $HOME -S tmux
