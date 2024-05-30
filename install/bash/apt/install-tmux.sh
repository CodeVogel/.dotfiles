#!/bin/bash
# deps: stow, git
sudo apt-get install tmux -y
stow -d $HOME/.dotfiles/ -t $HOME -S tmux

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'ℹ️ TMUX is installed, but do not forget to install the tmux plugins! To do this, run tmux and press <leader> + I'
