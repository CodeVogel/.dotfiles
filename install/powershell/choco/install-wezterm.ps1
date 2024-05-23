# Install wezterm with choco
choco install wezterm -y
& "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\install\powershell\make-symlink.ps1" -linkPath "$HOME/.wezterm.lua" -targetPath "\\wsl$\Ubuntu\home\$(whoami)\.dotfiles\wezterm\.wezterm.lua"

