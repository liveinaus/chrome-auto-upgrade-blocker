# ToggleChromeUpdate.ps1
# A script to enable or disable Google Chrome auto-updates on Windows

param(
    [string]$action = "disable" # Action: "disable" or "enable"
)

# Google Update service names
$services = @("gupdate", "gupdatem")

# Registry path for Chrome update policy
$registryPath = "HKLM:\Software\Policies\Google\Update"

function Disable-ChromeUpdates {
    Write-Host "Disabling Chrome auto-update..." -ForegroundColor Yellow

    # Disable Google Update services
    foreach ($service in $services) {
        if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
            Stop-Service -Name $service -Force
            Set-Service -Name $service -StartupType Disabled
            Write-Host "Service '$service' disabled."
        } else {
            Write-Host "Service '$service' not found."
        }
    }

    # Set registry policy to block updates
    if (!(Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }
    Set-ItemProperty -Path $registryPath -Name "AutoUpdateCheckPeriodMinutes" -Value 0
    Set-ItemProperty -Path $registryPath -Name "DisableAutoUpdateChecksCheckboxValue" -Value 1

    Write-Host "Chrome auto-update disabled."
}

function Enable-ChromeUpdates {
    Write-Host "Enabling Chrome auto-update..." -ForegroundColor Green

    # Enable Google Update services
    foreach ($service in $services) {
        if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
            Set-Service -Name $service -StartupType Automatic
            Start-Service -Name $service
            Write-Host "Service '$service' enabled."
        } else {
            Write-Host "Service '$service' not found."
        }
    }

    # Remove registry policy to allow updates
    if (Test-Path $registryPath) {
        Remove-Item -Path $registryPath -Recurse -ErrorAction SilentlyContinue
        Write-Host "Registry policies removed."
    } else {
        Write-Host "Registry policies not found."
    }

    Write-Host "Chrome auto-update enabled."
}

# Main logic
switch ($action) {
    "disable" { Disable-ChromeUpdates }
    "enable" { Enable-ChromeUpdates }
    default { Write-Host "Invalid action. Use 'disable' or 'enable'." -ForegroundColor Red }
}