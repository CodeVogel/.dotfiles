#!/bin/bash

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
(
  echo
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
) >>/home/$(whoami)/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
