# Simple PowerShell script to run Raymond QMS
# This script avoids using the '&&' operator which is not supported in some PowerShell versions

# Change to the project directory
Set-Location -Path $PSScriptRoot

# Display information
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "             RAYMOND QUALITY MANAGEMENT SYSTEM      " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting development server..." -ForegroundColor Green
Write-Host "Current directory: $PWD" -ForegroundColor Yellow
Write-Host ""

# Start the development server
npm start 