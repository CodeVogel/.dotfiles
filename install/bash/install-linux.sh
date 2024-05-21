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
      # Check if the path is relative
      if [[ $line != /* ]]; then
          # Convert the relative path to an absolute path
          line="$INSTALL_DIR/$line"
      fi
      source "$line"
   fi
done < "$CONF_FILE"
