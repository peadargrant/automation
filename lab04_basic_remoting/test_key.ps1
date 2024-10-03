#!/usr/bin/pwsh
# Test if a machine has key

if ( Test-Path -Type Leaf -Path '~/.ssh/id_ed25519.pub' ) {
    Write-Host 'public / private keypair exists'
}
else {
    Write-Host 'key pair does not exist'
}

