$WSLHOME = "\\wsl$\Ubuntu\home\$(wsl whoami)"
& $WSLHOME\.dotfiles\install\powershell\make-symlink.ps1 -linkPath $PSHOME\Profile.ps1 -targetPath $WSLHOME\.dotfiles\powershell\Profile.ps1



# Install chocolatey
PowerShell -Command "& $WSLHOME\.dotfiles\install\powershell\install-chocolatey.ps1"
PowerShell -Command "& $WSLHOME\.dotfiles\install\powershell\install-chocos.ps1"
