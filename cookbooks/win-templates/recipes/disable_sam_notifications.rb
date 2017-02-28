log 'Disable Security and Maintenance notifications in Action Centre'
registry_key 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance' do
  values [{
    :name => 'Enabled',
    :type => :dword,
    :data => 0
  }]
  action :create_if_missing
end