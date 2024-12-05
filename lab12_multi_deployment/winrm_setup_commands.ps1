#!/usr/bin/env pwsh
# Set up (insecure) WinRM for Ansible
# Peadar Grant

winrm quickconfig
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $True
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $True

