# Add brew install dir to path
export PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH

# Path to oh-my-zsh ( https://ohmyz.sh/ ) installation.
export ZSH=~/ohmyzsh

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see oh-my-zsh #5765)
COMPLETION_WAITING_DOTS="true"

 # remind to update when it's time
zstyle ':omz:update' mode reminder

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/patriksvensson.omp.json)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
