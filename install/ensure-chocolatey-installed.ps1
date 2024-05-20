$choc_installed = Get-Command -Name choco.exe -ErrorAction SilentlyContinue

if (-Not $choc_installed)
{
   & "$env:WSLHOME_IN_WIN/.dotfiles/install/install-chocolatey.ps1"
}
