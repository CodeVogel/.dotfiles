Read-Host "Starting installation of tools through Chocolatey. Press Enter to continue."

$chocos_dir = "\\wsl$\Ubuntu\home\$(wsl whoami)\.dotfiles\install\powershell\chocos"
$chocos = Get-ChildItem -Path $chocos_dir -Filter "*.ps1"

foreach ($chocolate in $chocos) {
   $name = $chocolate.Name
   $path = Join-Path -Path $chocos_dir -ChildPath $name
   if (Test-Path $path) {
      Write-Host "Now installing $name"
      & $path
      Write-Host "Finished installing $name"
      RefreshEnv
   } else {
      Write-Host "Did not find $name at $path"
      break
   }
}

Read-Host "All done with the chocos. Press Enter To Continue."
