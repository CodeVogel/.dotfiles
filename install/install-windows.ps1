$scripts = @(
   "install-chocolatey.ps1",
   "install-alacritty.ps1"
)

foreach ($scriptname in $scripts) {
   $path = "$env:WSLHOME_IN_WIN/.dotfiles/install/$scriptname"
   if (Test-Path $path) {
      Write-Host "Now installing $scriptname"
      & $path
      Write-Host "Finished installing $scriptname"
   } else {
      Write-Host "Did not find $scriptname at $path"
      break
   }
}

Read-Host "Press Enter To Continue"
