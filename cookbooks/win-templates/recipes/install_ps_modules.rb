powershell_script 'install Nuget package provider' do
  code "Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force"
  not_if '(Get-PackageProvider -Name Nuget -ListAvailable -ErrorAction SilentlyContinue) -ne $null'
end

%w{PSWindowsUpdate xNetworking xRemoteDesktopAdmin xCertificate}.each do |ps_module|
  powershell_script "install #{ps_module} module" do
    code "Install-Module #{ps_module} -Force"
    not_if "(Get-Module #{ps_module} -list) -ne $null"
  end
end