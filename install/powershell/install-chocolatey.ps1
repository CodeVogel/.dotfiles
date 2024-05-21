# Run this in an administrative shell
# Follows the installation instructions from https://chocolatey.org/install#individual 

# Get-ExecutionPolicy may not be Restricted
if ($(Get-ExecutionPolicy) -eq "Restricted")
{
   Set-ExecutionPolicy AllSigned
}

# Install chocolatey through the shell script at https://community.chocolatey.org/install.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
