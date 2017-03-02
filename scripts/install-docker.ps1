#Write-Host 'Installing Docker...'
#Import-Module -Name DockerMsftProvider -Repository PSGallery -Force
#Import-Packageprovider -Name DockerMsftProvider -Force
#Install-Package -Name docker -ProviderName DockerMsftProvider -Force
#Write-Host 'Complete...'

$ProgressPreference = 'SilentlyContinue'

Set-ExecutionPolicy Bypass -scope Process
New-Item -Type Directory -Path "$($env:ProgramFiles)\docker"
wget -outfile $env:TEMP\docker-1.13.1.zip "https://dockermsft.blob.core.windows.net/dockercontainer/docker-1-13-1.zip"
Expand-Archive -Path $env:TEMP\docker-1.13.1.zip -DestinationPath $env:TEMP -Force
copy $env:TEMP\docker\*.exe $env:ProgramFiles\docker
Remove-Item $env:TEMP\docker-1.13.1.zip
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$($env:ProgramFiles)\docker", [EnvironmentVariableTarget]::Machine)
$env:Path = $env:Path + ";$($env:ProgramFiles)\docker"
. dockerd --register-service -H npipe:// -H 0.0.0.0:2375 -G docker
Start-Service docker