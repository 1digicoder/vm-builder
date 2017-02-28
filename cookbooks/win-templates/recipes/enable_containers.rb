windows_feature "Containers" do
  action :install
  all true
end

reboot "app_requires_reboot" do
    action :request_reboot
    reason 'Need to reboot for container installation'
    delay_mins 1
end