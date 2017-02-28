log 'Disable Shutdown Event Tracker'

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' do
  values [{
    :name => 'ShutdownReasonOn',
    :type => :dword,
    :data => 0
  }]
  action :create_if_missing
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' do
  values [{
    :name => 'ShutdownReasonUI',
    :type => :dword,
    :data => 0
  }]
  action :create_if_missing
end