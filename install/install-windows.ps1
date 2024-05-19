$scripts = @(
   "install-chocolatey.ps1",
   "install-alacritty.ps1"
)

foreach ($script in $scripts) {
   $path = "$env:WSLHOME_IN_WIN/.dotfiles/install/$script"
   if (Test-Path $path) {
      Write-Host "Now installing $script"
      & $script
      Write-Host "Finished installing $script"
   } else {
      Write-Host "Did not find $script at $path"
      break
   }
   echo $path
}

Read-Host "Press Enter To Continue"
