#!/bin/bash
# deps: stow, git
sudo apt-get install tmux -y
stow -d $HOME/.dotfiles/ -t $HOME -S tmux

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
