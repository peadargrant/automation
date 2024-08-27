#!/usr/bin/env pwsh
# Auto configure Git from Windows Domain Login info

$username = $(whoami)
Write-Host "Username: $username"

$email = "$username@student.dkit.ie"
Write-Host "E-mail address: $email"

$fullname = (Get-WMIObject Win32_UserAccount | where caption -eq $username | select FullName).FullName
Write-Host "Fullname: $fullname"



