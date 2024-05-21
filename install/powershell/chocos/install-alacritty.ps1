# Install alacritty with choco
choco install alacritty -y

$linkDir = "$env:APPDATA\alacritty"
$linkPath = "$linkDir\alacritty.toml"
$targetPath = "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\alacritty\alacritty.toml"

# Throw error if alacritty toml is missing
if (-Not (Test-Path $targetPath)) {
   Write-Output "Tried making a symlink $linkPath to target $targetPath but target does not exist."
}

# Create directory %APPDATA%\alacritty if it does not exist
if (-Not (Test-Path $linkDir)) {
   New-Item -ItemType Directory -Path $env:APPDATA -Name "alacritty"
}

# Symlink alacritty config from the expected path on Windows into .dotfiles
New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
