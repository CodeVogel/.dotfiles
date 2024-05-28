# Run this in an administrative shell
# Follows the installation instructions from https://chocolatey.org/install#individual 

# Get-ExecutionPolicy must not be Restricted
if ($(Get-ExecutionPolicy) -eq "Restricted")
{
   $response = Read-Host -Prompt "❗ExecutionPolicy is Restricted. Set the execution policy to AllSigned? (y/n)"
   if ($response -eq "y")
   {
      Set-ExecutionPolicy AllSigned
   }
   else
   {
      Write-Host "❌ Exiting script. ExecutionPolicy must be AllSigned or Unrestricted to install Chocolatey."
      exit 1
   }
}

# Install chocolatey through the shell script at https://community.chocolatey.org/install.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
