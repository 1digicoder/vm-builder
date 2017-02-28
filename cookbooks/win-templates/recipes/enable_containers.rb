log "Installing Containers..."

windows_feature "Containers" do
  action :install
  all true
end

log "Installing Docker..."

powershell_script 'install_vm_tools' do
    code <<-EOH
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    Install-Package -Name docker -ProviderName DockerMsftProvider -Force
    EOH
end