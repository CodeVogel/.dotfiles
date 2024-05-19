$scripts = @(
   "./install-chocolatey.ps1",
   "./install-alacritty.ps1"
)

foreach ($script in $scripts) {
   if (Test-Path $script) {
      Write-Host "Now installing $script"
      & $script
      Write-Host "Finished installing $script"
   } else {
      Write-Host "Did not find $script!"
      break
   }
}
