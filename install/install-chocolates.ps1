Read-Host "Starting installation of tools through Chocolatey. Press Enter to continue."

$scripts = @(
   "install-alacritty.ps1"
)

foreach ($scriptname in $scripts) {
   $path = "$env:WSLHOME_IN_WIN/.dotfiles/install/$scriptname"
   if (Test-Path $path) {
      Write-Host "Now installing $scriptname"
      & $path
      Write-Host "Finished installing $scriptname"
      RefreshEnv
   } else {
      Write-Host "Did not find $scriptname at $path"
      break
   }
}

Read-Host "Press Enter To Continue"
