$choc_installed = Get-Command -Name choco.exe -ErrorAction SilentlyContinue

if (-Not $choc_installed)
{
   & "//wsl$/Ubuntu/home/$(wsl whoami)/.dotfiles/install/install-chocolatey.ps1"
}
