log "Show file extensions"
registry_key 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' do
  values [{
    :name => 'HideFileExt',
    :type => :dword,
    :data => 0
  }]
end