log "Installing VM Tools..."
powershell_script 'install_vm_tools' do
    code <<-EOH
    $vmware_iso = "C:\\Windows\\Temp\\vmware-tools.iso"
    $platform = (Get-WmiObject -Class Win32_ComputerSystem).Manufacturer

    if ($platform -like '*VMware*') {
        Write-Host 'VMware platform detected'
        if ($vmware_iso -ne $null) {
                if (Test-Path -Path $vmware_iso) {

                    Write-Host "* VMware Tools ISO found at $vmware_iso"

                    # Mount the VMware tools ISO and run the installer
                    Write-Host '* Mounting the ISO and installing VMware Tools'
                    Mount-DiskImage -ImagePath $vmware_iso
                    $drive = (Get-DiskImage -ImagePath $vmware_iso | Get-Volume).Driveletter
                    $root = (Get-PSDrive -Name $drive).Root
                    $installer = $root + 'setup64.exe'
                    $parameters = '/S /v "/qn REBOOT=R"'
                    Start-Process $installer $parameters -Wait

                    # Dismount and delete the ISO
                    Dismount-DiskImage -ImagePath $vmware_iso
                    Write-Host '* Deleting uploaded VMware tools ISO'
                    Remove-Item $vmware_iso
                } else {
                    Write-Host "* WARNING: VMware tools ISO not found: $vmware_iso"
                }
            } else {
                Write-Host "* WARNING: Path to uploaded ISO unknown: empty env var"
            }
        } else {
            Write-Host "* WARNING: Unknown platform: $platform"
        }

    Write-Host 'Complete'
    EOH
end