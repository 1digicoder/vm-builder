$ProgressPreference='SilentlyContinue'

$uninstallSuccess = $false
while(!$uninstallSuccess) {
  Write-Host "Attempting to uninstall features..."
  try {
    Get-WindowsFeature | ? { $_.InstallState -eq 'Available' } | Uninstall-WindowsFeature -Remove -ErrorAction Stop
    Write-Host "Uninstall succeeded!"
    $uninstallSuccess = $true
  }
  catch {
    Write-Host "Waiting two minutes before next attempt"
    Start-Sleep -Seconds 120
  }
}
