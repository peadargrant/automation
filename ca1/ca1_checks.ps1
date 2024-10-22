#!/usr/bin/env pwsh
# File checks for CA1

$files = @(
    'inventory.ini',
    'setup_playbook.yml',
    'instructions.txt',
    'non_automatable.txt'
)

Write-Host "pre-submission checks for automation ca1" -ForegroundColor Cyan

$issues = 0
foreach ( $file in $files ) {
    Write-Host "checking for $file ... " -NoNewline
    if ( Test-Path -Type Leaf -Path $file ) {
	Write-Host "ok" -ForegroundColor Green
    }
    else
    {
	Write-Host "not found" -ForegroundColor Red
	$issues = $issues + 1
    }
}

if ( $issues -gt 0 ) {
    Write-Host "$issues issues found" -ForegroundColor Red
    Write-Host "fix and re-run before submission!" -ForegroundColor Red
}
else {
    Write-Host "ready to submit" -ForegroundColor Green
}
