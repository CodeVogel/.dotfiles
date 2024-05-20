

$choc_installed = Get-Command -Name choco.exe -ErrorAction SilentlyContinue

if (-Not $choc_installed)
{
   ReadHost "Chocolatey is not installed. Press Enter to try to install it."
   & "//wsl$/Ubuntu/home/$(wsl whoami)/.dotfiles/install/install-chocolatey.ps1"
   ReadHost "Chocolatey is now installed. Press Enter to continue."
}
else {
   ReadHost "Chocolatey is already installed. Press Enter to continue."
}
