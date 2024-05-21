#!/bin/bash

# Update available packages
sudo apt update

# Define a function to read and source a configuration file
read_and_source() {
    INSTALL_DIR="/home/$(whoami)/.dotfiles/install/bash/$1"
    CONF_FILE="$INSTALL_DIR/active.conf"

    # Check if the configuration file exists
    if [ ! -f "$CONF_FILE" ]; then
        echo "Configuration file not found: $CONF_FILE"
        exit 1
    fi

    # Read the configuration file line by line
    while IFS= read -r line
    do
        # Ignore lines starting with '#'
        if [[ $line != \#* ]]; then
            # Check if the path is relative
            if [[ $line != /* ]]; then
                # Convert the relative path to an absolute path
                line="$INSTALL_DIR/$line"
            fi
            source "$line"
        fi
    done < "$CONF_FILE"
}

# Call the function with different configuration files
read_and_source curl
read_and_source apt
read_and_source brew
