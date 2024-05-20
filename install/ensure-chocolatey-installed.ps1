

$choc_installed = Get-Command -Name choco.exe -ErrorAction SilentlyContinue

if (-Not $choc_installed)
{
   Read-Host "Chocolatey is not installed. Press Enter to try to install it."
   & "//wsl$/Ubuntu/home/$(wsl whoami)/.dotfiles/install/install-chocolatey.ps1"
   Read-Host "Chocolatey is now installed. Press Enter to continue."
}
else {
   Read-Host "Chocolatey is already installed. Press Enter to continue."
}
