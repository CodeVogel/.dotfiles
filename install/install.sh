
windows_install_script="~/.dotfiles/install/install-windows.ps1"

if [ -f "$windows_install_script"]
   powershell.exe -command "Start-Process -FilePath powershell.exe -ArgumentList '-File $windows_install_script' -Verb RunAs"
else
   echo "Could not find the install script for Windows software, supposedly located at $windows_install_script"
fi


# # Update available packages
# sudo apt update
#
# # Install GNU Stow
# sudo apt install stow -y
# sudo apt install zsh -y
#
# # Change default shell to zsh
# chsh -s $(which zsh) 
# # Set dotfiles location for zsh
# export ZDOTDIR=~/.dotfiles/zsh
#
# # Export env variable so the oh-my-zsh install script does not override our .zshrc 
# export KEEP_ZSHRC='yes'
# # Install oh-my-zsh (unattended: does not open zsh afterwards, and does not change default shell)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#
# # Install oh-my-posh
# curl -s https://ohmyposh.dev/install.sh | bash -s
#
# ps_command='New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.toml -Target \\wsl$\Ubuntu\home\'$(whoami)'\.dotfiles\alacritty\alacritty.toml'
# powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '$ps_command'"