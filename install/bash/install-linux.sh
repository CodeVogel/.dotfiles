#!/bin/bash

# Update available packages
sudo apt update

# Define a function to read and source a configuration file
INSTALL_DIR="/home/$(whoami)/.dotfiles/install/bash"
CONF_FILE="$INSTALL_DIR/active.conf"

# Check if the configuration file exists
if [ ! -f "$CONF_FILE" ]; then
   echo "Configuration file not found: $CONF_FILE"
   exit 1
fi

# Read the configuration file line by line
while IFS= read -r line
do
   # Ignore lines starting with '#' and empty lines
   if [[ $line != \#* ]] && [ -n "$line" ]; then
      # If path starts with './', replace it with the path to the install directory 
      if [[ $line == ./* ]]; then
         line="$INSTALL_DIR/${line:2}"
      fi
      source "$line"
   fi
done < "$CONF_FILE"
