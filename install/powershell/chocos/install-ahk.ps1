choco install autohotkey -y

# Load the summon_alacritty script on startup
$targetPath = "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\ahk\summon-wezterm.ahk"
$linkPath = "$([Environment]::GetFolderPath("Startup"))\summon-wezterm.ahk"
New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
