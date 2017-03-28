Write-Host 'Installing Docker...'

Import-Module -Name DockerMsftProvider -Repository PSGallery -Force
Import-Packageprovider -Name DockerMsftProvider -Force

#
# See issue: https://github.com/OneGet/MicrosoftDockerProvider/issues/18
# Post install / after machine comes up, you can use the install-package style, but the issue
# for automation for machine building, is that BITS downloads do not play nicely with automation
#
# After that time, the simple docker commands can be used to update the packages via OnGet repos
# Install-Package -Name docker -ProviderName DockerMsftProvider -Force
#

$ProgressPreference = 'SilentlyContinue'

Set-ExecutionPolicy Bypass -scope Process
New-Item -Type Directory -Path "$($env:ProgramFiles)\docker"
wget -outfile $env:TEMP\docker-17-03-0-ee.zip "https://dockermsft.blob.core.windows.net/dockercontainer/docker-17-03-0-ee.zip"
Expand-Archive -Path $env:TEMP\docker-17-03-0-ee.zip -DestinationPath $env:TEMP -Force
Copy-Item $env:TEMP\docker\*.exe $env:ProgramFiles\docker
Remove-Item $env:TEMP\docker-17-03-0-ee.zip
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$($env:ProgramFiles)\docker", [EnvironmentVariableTarget]::Machine)
$env:Path = $env:Path + ";$($env:ProgramFiles)\docker"
mkdir e:\docker_containers
Copy-Item daemon.json "C:\ProgramData\docker\config\"

. dockerd --register-service -H npipe:// -H 0.0.0.0:2375 -G docker
Start-Service docker

Write-Host 'Complete...'