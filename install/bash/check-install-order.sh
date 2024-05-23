#!/bin/bash
# Function to extract package names from file paths
extract_package_names() {
  local file_paths=("$@")
  local packages=()
  for file_path in "${file_paths[@]}"; do
    package_name=$(basename "$file_path" | sed 's/install-\(.*\)\.sh/\1/')
    packages+=("$package_name")
  done
  echo "${packages[@]}"
}

# Function to read dependencies from install scripts
read_dependencies() {
  local file_paths=("$@")
  declare -A dependencies
  for file_path in "${file_paths[@]}"; do
    package_name=$(basename "$file_path" | sed 's/install-\(.*\)\.sh/\1/')
    while IFS= read -r line; do
      if [[ "$line" =~ ^#\s*DEPS:\s*(.*) ]]; then
        deps_line="${BASH_REMATCH[1]}"
        dependencies["$package_name"]="$deps_line"
        break
      fi
    done <"$file_path"
  done

  echo "${!dependencies[@]}"
  echo "${dependencies[@]}"
}

# Function to check if dependencies are installed in the correct order
check_dependency_order() {
  local packages=("$@")
  local dep_list=("$@")
  shift ${#packages[@]}
  declare -A dependencies
  for i in "${!packages[@]}"; do
    dependencies["${packages[$i]}"]="${dep_list[$i]}"
  done

  for i in "${!packages[@]}"; do
    package="${packages[$i]}"
    if [[ -n "${dependencies[$package]}" ]]; then
      IFS=', ' read -r -a deps <<<"${dependencies[$package]}"
      for dep in "${deps[@]}"; do
        for j in "${!packages[@]}"; do
          if [[ "$dep" == "${packages[$j]}" && "$j" -gt "$i" ]]; then
            echo "Error: Package '$package' depends on '$dep' which is installed after '$package'."
            return 1
          fi
        done
      done
    fi
  done

  echo "All dependencies are in correct order."
  return 0
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  file_paths=("$@")
  # Extract package names
  package_names=($(extract_package_names "${file_paths[@]}"))
  # Read dependencies
  dependencies=($(read_dependencies "${file_paths[@]}"))
  # Check dependencies
  check_dependency_order "${package_names[@]}" "${dependencies[@]}"
fi
