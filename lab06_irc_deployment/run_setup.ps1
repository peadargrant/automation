#!/usr/bin/env pwsh
# Transfer SSH key (example)

$TargetIp = Get-Content target_ip.txt

sftp -o StrictHostKeyChecking=accept-new -b sftp_commands.txt administrator@$TargetIp

ssh -t administrator@$TargetIp ./setup.sh

