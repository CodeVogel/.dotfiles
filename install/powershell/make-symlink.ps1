param (
   [string]$linkPath,
   [string]$targetPath
)

# Split linkPath into directory and file
$linkDir = Split-Path $linkPath -Parent
$linkFile = Split-Path $linkPath -Leaf

# Setup symlink to wezterm config
$targetPath = "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\wezterm\.wezterm.lua"

# Throw error if the target doesn't exist
if (-Not (Test-Path $targetPath)) {
   Write-Output "Tried making a symlink $linkPath to target $targetPath but target does not exist."
   return 1
}

# Check if any of the variables are empty or whitespace
if (-Not $linkDir -or -Not $linkPath -or -Not $targetPath) {
   Write-Output "Passed an empty variable! Usage: make-symlink.ps1 <linkDir> <linkPath> <targetPath>"
   return 1
}

# Attempt to make the link directory if it doesn't exist
if (-Not (Test-Path $linkDir)) {
   # Ask for confirmation first
   $response = Read-Host "Link directory $linkDir does not exist. Create it? (y/n)" 
   if ($response -ne "y") {
      Write-Output "Link directory $linkDir does not exist. Not creating."
      return 1
   }
   New-Item -ItemType Directory -Path $linkDir
}

# If the symlink already exists, remove it
if (Test-Path $linkPath) {
   # Ask for confirmation first
   $response = Read-Host "Symlink already exists at $linkPath. Remove it? (y/n)"
   if ($response -ne "y") {
      Write-Output "Symlink already exists at $linkPath. Not removing."
      return 1
   }
   Write-Output "Removing symlink at $linkPath"
   Remove-Item $linkPath
}

Write-Output "Creating symlink at $linkPath to target $targetPath"
# Symlink alacritty config from the expected path on Windows into .dotfiles
New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
