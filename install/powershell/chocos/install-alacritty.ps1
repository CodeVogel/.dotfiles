# Install alacritty with choco
choco install alacritty -y

$link_dir = "$env:APPDATA\alacritty"
$link_path = "$link_dir\alacritty.toml"
$target_path = "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\alacritty\alacritty.toml"

# Throw error if alacritty toml is missing
if (-Not (Test-Path $targetpath)) {
   Write-Output "Tried making a symlink $link_path to target $target_path but target does not exist."
}

# Create directory %APPDATA%\alacritty if it does not exist
if (-Not (Test-Path $link_dir)) {
   New-Item -ItemType Directory -Path $link_dir -Name "alacritty"
}

# Symlink alacritty config from the expected path on Windows into .dotfiles
New-Item -ItemType SymbolicLink -Path $link_path -Target $target_path
