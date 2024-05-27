Write-Host "Starting installation of tools through Chocolatey..."

$scriptsDir = "//wsl$/Ubuntu/home/$(wsl whoami)/.dotfiles/install/powershell/chocos"
$activeConf = Join-Path -Path $scriptsDir -ChildPath "active.conf"

# Check if the conf file exists
if (!(Test-Path $activeConf)) {
    Write-Out "Configuration file for active scripts not found at $activeConf"
    exit 1
}

# Read the script paths from the conf file and filter out comments
$activeScripts = Get-Content $activeConf | Where-Object { $_ -notmatch "^#" }

foreach ($scriptPath in $activeScripts) {
   # Resolve relative paths
   if ($scriptPath -match "^\.") {
      $scriptPath = Resolve-Path (Join-Path -Path $scriptsDir -ChildPath $scriptPath)
   }

   if (Test-Path $scriptPath) {
      Write-Host "Now installing $scriptPath"
      & $scriptPath
      Write-Host "Finished installing $scriptPath"
      RefreshEnv
   } else {
      Write-Out "Did not find script at $scriptPath"
      exit 1
   }
}

Write-Out "Finished installation of tools through Chocolatey."
