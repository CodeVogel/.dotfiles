$WSLHOME = "\\wsl$\Ubuntu\home\$(wsl whoami)"
& $WSL_HOME\.dotfiles\install\powershell\make-symlink.ps1 -linkPath $PSHOME\Profile.ps1 -targetPath $WSLHOME\.dotfiles\powershell\Profile.ps1


