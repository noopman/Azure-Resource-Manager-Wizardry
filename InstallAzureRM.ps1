# This must run as Admin

Write-Host "PowerShell version"
$PSVersionTable.PSVersion

Write-Host "Azure Module"
(Get-Module -ListAvailable | Where-Object{ $_.Name -eq 'Azure' }) | Select Version, Name, Author, PowerShellVersion | FL;

Write-Host "AzureRm.Resources module"
(Get-Module -ListAvailable | Where-Object{ $_.Name -eq 'AzureRm.Resources' }) | Select Version, Name, Author, PowerShellVersion | FL;

Write-Host "*Azure* Modules"
(Get-Module -ListAvailable | Where-Object{ $_.Name -like '*Azure*' }) | Select Version, Name, Author, PowerShellVersion | FL;

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

#Set-PSRepository

# Install the Azure Resource Manager modules from the PowerShell Gallery
Install-Module -Scope AllUsers -Force AzureRM

#PackageManagement\Install-Package : A command with name 'Get-AzureStorageContainerAcl' is already available on this system. This module 'Azure.Storage' may override the existing commands. 
#If you still want to install this module 'Azure.Storage', use -AllowClobber parameter.
#At C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:1661 char:21
#+ ...          $null = PackageManagement\Install-Package @PSBoundParameters
#+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#    + CategoryInfo          : InvalidOperation: (Microsoft.Power....InstallPackage:InstallPackage) [Install-Package], Exception
#    + FullyQualifiedErrorId : CommandAlreadyAvailable,Validate-ModuleCommandAlreadyAvailable,Microsoft.PowerShell.PackageManagement.Cmdlets.InstallPackage

# Install the Azure Service Management module from the PowerShell Gallery
Install-Module Azure -Force

#PackageManagement\Install-Package : Cannot process argument transformation on parameter 'InstalledModuleInfo'. Cannot convert the "System.Object[]" value of type "System.Object[]" to type 
#"System.Management.Automation.PSModuleInfo".
#At C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:1661 char:21
#+ ...          $null = PackageManagement\Install-Package @PSBoundParameters
#+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#    + CategoryInfo          : InvalidData: (Microsoft.Power....InstallPackage:InstallPackage) [Install-Package], Exception
#    + FullyQualifiedErrorId : ParameterArgumentTransformationError,Validate-ModuleAuthenticodeSignature,Microsoft.PowerShell.PackageManagement.Cmdlets.InstallPackage
