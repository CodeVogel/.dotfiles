param (
   [string]$linkPath,   # The path of the link
   [string]$targetPath  # The path of the actual file
)

####################################################################################################
# Determine correct usage of the script
####################################################################################################

# Check if arguments are provided
if (-not $linkPath -or -not $targetPath) {
    Write-Output "Usage: make-symlink.ps1 -linkPath <linkPath> -targetPath <targetPath>"
    exit 1
}

# Check if shell runs elevated
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "make-symlink does not have sufficient priviliges. Please run the script as an administrator."
    exit 1
}

# Check if target path exists
if (-not (Test-Path $targetPath)) {
    Write-Output "Target path $targetPath does not exist"
    exit 1
}

# Check if link directory exists
$directory = Split-Path $linkPath
if (-not (Test-Path $directory)) {
   # Offer to create directory
   $response = Read-Host -Prompt "Directory $directory does not exist. Create it? (y/n)"
   if ($response -eq "y") {
      New-Item -ItemType Directory -Path $directory
   } else {
      Write-Output "Exiting"
      exit 1
   }
}

# Check if link path already exists
if (Test-Path $linkPath) {
   # Offer to remove existing link
   $response = Read-Host -Prompt "A file $linkPath already exists. This may be an old symlink. Remove it? (y/n)"
   if ($response -eq "y") {
      Remove-Item $linkPath
   } else {
      Write-Output "Exiting"
      exit 1
   }
}

####################################################################################################
# Create the symlink
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item
####################################################################################################

Write-Output "Creating symlink at $linkPath to target $targetPath"
New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
