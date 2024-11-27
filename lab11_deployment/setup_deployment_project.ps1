#!/usr/bin/env pwsh
# Pipeline project setup
# Peadar Grant

# Default to system username (but can change by passing -GitLabUserName parameter)
param (
         [string]$GitLabUserName = $Env:Username
     )

# Copy template to a new folder to avoid nested Git repos
Copy-Item deployment_project -Destination ~/Desktop -Recurse

# Create repo, add files to git and push
cd ~/Desktop/deployment_project
git init --initial-branch=main
git remote add origin https://gitlab.comp.dkit.ie/$GitLabUserName/deployment_project.git
git add .
git commit -m "Initial commit"
git push --force --set-upstream origin main
