#!/usr/bin/env zsh
install_if_exists_powershell () {
   script_path=$1
   path_in_wsl="$HOME/$script_path"
   path_in_windows="//wsl$/Ubuntu/home/$(whoami)/$script_path"

   # Check if the script exists from WSL's POV
   if [[ -f "$path_in_wsl" ]]; then
      # Check if the script exists from Windows' POV
      if [[ "$(powershell.exe -command "Test-Path $path_in_windows -PathType Leaf" | tr -d '\r')" == "True" ]]; then 
         # Run the install script
         powershell.exe -command "Start-Process -FilePath powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File $path_in_windows' -Verb RunAs -Wait"
         echo "Ran $path_in_windows. Now continuining, please wait..."
      else 
         # Throw error
         echo "Could not find the install script for Windows software from Windows' POV, supposedly located at $path_in_windows"
      fi
   else
      # Throw error
      echo "Could not find the install script for Windows software from WSL's POV, supposedly located at $path_in_wsl"
   fi

}

install_if_exists_powershell .dotfiles/install/powershell/ensure-chocolatey-installed.ps1
install_if_exists_powershell .dotfiles/install/powershell/install-chocos.ps1
