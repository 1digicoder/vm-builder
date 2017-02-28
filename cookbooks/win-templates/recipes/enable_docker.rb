log "Installing Docker..."

powershell_script 'install_vm_tools' do
    code <<-EOH
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    Install-Package -Name docker -ProviderName DockerMsftProvider -Force
    EOH
end

reboot "app_requires_reboot" do
    action :request_reboot
    reason 'Need to reboot for container installation'
    delay_mins 1
end