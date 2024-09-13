#!/usr/bin/env pwsh
# Watch recorded class
# Peadar Grant

# Load recordings
$recordings = (Get-Content recordings.json | ConvertFrom-Json).recordings

# Show list
Write-Host('Class Recordings:')
$index = 1
foreach ( $recording in $recordings ) {
    Write-Host ('[', $index, '] ', $recording.title, ' (', $recording.date, ')')
    $index = $index + 1
}

# Capture recording required
Write-Host('Enter index number: ')
$selectedIndex = [Int]( Read-Host ) - 1

# Offset index
$recording = $recordings[$selectedIndex]

# Print link to screen
Write-Host(' ')
Write-Host('URL is:')
Write-Host($recording.link)
Write-Host(' ')

