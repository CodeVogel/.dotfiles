# Set up a variable for the Windows home directory
export WIN_HOME=$(wslpath "$(cmd.exe /C echo %USERPROFILE% 2>/dev/null | tr -d '\r')")
export DOTFILES=$WIN_HOME/.dotfiles

# Path to oh-my-zsh ( https://ohmyz.sh/ ) installation.
export ZSH=~/.oh-my-zsh

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

eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/jandedobbeleer.omp.json)"
