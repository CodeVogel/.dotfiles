Read-Host -Prompt "Installing Windows Software. Press Enter to continue"

$WSLHOME = "\\wsl$\Ubuntu\home\$(wsl whoami)"
& $WSLHOME\.dotfiles\install\powershell\make-symlink.ps1 -linkPath $PSHOME\Profile.ps1 -targetPath $WSLHOME\.dotfiles\powershell\Profile.ps1

# Install chocolatey
Start-Process -FilePath powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File $WSLHOME\.dotfiles\install\powershell\install-chocolatey.ps1 -Wait" -Verb RunAs
Start-Process -FilePath powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File $WSLHOME\.dotfiles\install\powershell\install-chocos.ps1 -Wait" -Verb RunAs
