log "Installing Docker..."

powershell_script 'install_docker' do
    code <<-EOH
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    Install-Package -Name docker -ProviderName DockerMsftProvider -Force
    EOH
end