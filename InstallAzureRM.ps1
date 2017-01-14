# Please Note!
# This must run as Admin!
#

Write-Host "PowerShell version"
$PSVersionTable.PSVersion

Write-Host "*Azure* Modules"
(Get-Module -ListAvailable | Where-Object{ $_.Name -like '*Azure*' }) | Select Version, Name, Author, PowerShellVersion | FL;

#Get-PackageProvider
#Find-PackageProvider
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Force

#
# Install the Azure Resource Manager modules from the PowerShell Gallery
#

# AzureRM
Install-Module -Scope AllUsers -Force AzureRM

# AzureAD
Install-Module -Scope AllUsers -Name AzureAD -Force
# or
#Install-Module -Name AzureADPreview 

# Install the Azure Service Management module from the PowerShell Gallery
#Install-Module Azure -Force
