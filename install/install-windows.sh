#!/usr/bin/env zsh

# Determine wsl $HOME from Windows POV
powershell_script_path='.dotfiles/install/install-windows.ps1' # relative to $HOME
# get script location from the WSL POV and Windows POV
powershell_script_in_wsl="$HOME/$powershell_script_path"
powershell_script_in_windows="$WSLHOME_IN_WIN/$powershell_script_path"

# Check if the script exists from WSL's POV
if [[ -f "$powershell_script_in_wsl" ]]; then
   # Check if the script exists from Windows' POV
   if [[ "$(powershell.exe -command "Test-Path $powershell_script_in_windows -PathType Leaf" | tr -d '\r')" == "True" ]]; then 
      # Run the install script
      powershell.exe -command "Start-Process -FilePath powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File $powershell_script_in_windows' -Verb RunAs"
   else 
      # Throw error
      echo "Could not find the install script for Windows software from Windows' POV, supposedly located at $powershell_script_in_windows"
   fi
else
   # Throw error
   echo "Could not find the install script for Windows software from WSL's POV, supposedly located at $powershell_script_in_wsl"
fi
