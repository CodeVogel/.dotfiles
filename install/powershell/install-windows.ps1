# Read-Host -Prompt "Installing Windows Software. Press Enter to continue"

$WSLHOME = "\\wsl$\Ubuntu\home\$(wsl whoami)"
& $WSLHOME\.dotfiles\install\powershell\make-symlink.ps1 -linkPath $PSHOME\Profile.ps1 -targetPath $WSLHOME\.dotfiles\powershell\Profile.ps1

# Install chocolatey
Write-Host "Installing Chocolatey if not installed..."
Start-Process -FilePath powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File $WSLHOME\.dotfiles\install\powershell\install-chocolatey.ps1 -Wait" -Verb RunAs -Wait

Write-Host "Installing chocolatey packages..."
# Refresh path
$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')
$installChocosCommand = "-ExecutionPolicy Bypass -File $WSLHOME\.dotfiles\install\powershell\install-chocos.ps1"
Start-Process -FilePath powershell.exe -ArgumentList "$installChocosCommand" -Verb RunAs -Wait
