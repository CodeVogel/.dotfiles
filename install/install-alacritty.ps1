# Install alacritty with choco
choco install alacritty -y

# Symlink alacritty config from the expected path on Windows into .dotfiles
New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.toml -Target \\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\alacritty\alacritty.toml
