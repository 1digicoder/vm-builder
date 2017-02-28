log "Show hidden files"
registry_key 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' do
  values [{
    :name => 'Hidden',
    :type => :dword,
    :data => 1
  }]
end