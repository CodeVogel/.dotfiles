# Define the path to the configuration file
CONF_FILE=~/.dotfiles/install/bash/apt/active.conf

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
            line="$(pwd)/$line"
        fi
        source "$line"
    fi
done < "$CONF_FILE"
