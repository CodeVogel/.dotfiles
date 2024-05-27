#!/bin/bash
# Function to check installation order
check_install_order() {
  local files=("$@")
  local packages=()

  # Extract package names
  for file in "${files[@]}"; do
    package_name=$(basename "$file" | sed 's/install-//;s/\.sh.*//')
    # Extract dependencies from the file
    dependencies=$(grep -iE "#*.deps*.:" "$file" | sed 's/#*.deps*.//I' | tr -d ' ')
    # for each dependency by comma
    for dependency in $(echo "$dependencies" | tr ',' '\n'); do
      # Check if the dependency is in the list of packages
      if ! echo "${packages[@]}" | grep -q "$dependency"; then
        echo "INVALID INSTALLATION ORDER (at $file):"
        echo "The installer for '$package_name' lists '$dependency' as a dependency, but '$dependency' is not yet present in the list of packages."
        return 1
      fi
    done

    packages+=("$package_name")
  done

  echo "All packages are in the correct order."
  return 0
}
