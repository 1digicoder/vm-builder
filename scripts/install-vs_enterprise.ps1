Get-ChildItem -Path ..\isoimages\vs2017_offline\enterprise\certificates -Filter *.p12 | Import-PfxCertificate -CertStoreLocation cert:\localMachine\my

& ..\isoimages\vs2017_offline\enterprise\vs_enterprise.exe `
--passive `
--norestart `
--add Microsoft.VisualStudio.Workload.Azure `
--add Microsoft.VisualStudio.Workload.Data `
--add Microsoft.VisualStudio.Workload.NetCoreTools `
--add Microsoft.VisualStudio.Workload.NetWeb `
--add Microsoft.VisualStudio.Workload.ManagedDesktop `
--add Microsoft.VisualStudio.Workload.Node `
--add Microsoft.Net.Component.4.6.2.SDK `
--add Microsoft.Net.Component.4.6.2.TargetingPack `
--add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools `
--add Microsoft.VisualStudio.Component.DiagnosticTools `
--add Microsoft.VisualStudio.Component.LiveUnitTesting `
--add Microsoft.VisualStudio.Component.DockerTools `
--add Microsoft.VisualStudio.Component.IntelliTrace.FrontEnd `
--add Microsoft.VisualStudio.Component.Git `
--add Microsoft.VisualStudio.Component.FSharp