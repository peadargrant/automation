#!/usr/bin/env pwsh
# Setup control node

param (
         [string]$ControlNodeUsername = "administrator",
		 [Parameter(Mandatory=$true)]
         [string]$ControlNodeIp 
     )
	 
Write-Host "testing can reach control node" -ForegroundColor Yellow
$results = Test-NetConnection -Port 22 -ComputerName $ControlNodeIp

if ( $results.TcpTestSucceeded -eq $false ) {
	throw "cannot connect to control node at $ControlNodeIp"
	
}

Write-Host "uploading files" -ForegroundColor Yellow
sftp -b sftp_commands.txt $ControlNodeUsername@$ControlNodeIp

Write-Host "running ansible installation and setup" -ForegroundColor Yellow
ssh -t $ControlNodeUsername@$ControlNodeIp "sudo apt -y install ansible && ansible-playbook -i control_inventory.ini control_playbook.yml --ask-become-pass"

