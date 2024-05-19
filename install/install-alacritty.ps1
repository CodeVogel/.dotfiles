# Install alacritty with choco
choco install alacritty -y

# Get linux user
linux_user = $(wsl whoami)

# Symlink alacritty config from the expected path on Windows into .dotfiles
New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.toml -Target \\wsl$\Ubuntu\home\$linux_user\.dotfiles\alacritty\alacritty.toml
