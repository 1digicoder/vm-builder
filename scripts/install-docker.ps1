Write-Host "Installing Docker provider via PSGallery..."
Import-Module -Name DockerMsftProvider -Force
Import-Packageprovider -Name DockerMsftProvider -Force

Write-Host "Installing Docker via Microsoft Provider..."
Install-Package -Name docker -ProviderName DockerMsftProvider -Force
Write-Host "Complete"