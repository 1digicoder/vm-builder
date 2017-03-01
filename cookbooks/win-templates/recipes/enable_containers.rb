log "Installing Containers..."

windows_feature "Containers" do
  action :install
  all true
end