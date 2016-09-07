# Your path will not be the same as this!
$demosPath = 'c:\Code\Azure Resource Manager'
Set-Location $demosPath

$PSVersionTable.PSVersion

#Get-Module -ListAvailable | Where-Object { $_.Name -like "AzureRM.Resources" } | Select Name, Version
#Name              Version
#----              -------
#AzureRM.Resources 2.0.1

Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

#--------------------

$azureCredential = Get-Credential
Login-AzureRmAccount -Credential $azureCredential

#Get-AzureRmSubscription

$subscriptionName = '{your subscription name}'
$subscriptionName = 'Martensson Consulting (BizSpark3)'

$resourceGroupName = 'ARMTraining'
$storageAccountName = 'armtraining42'

$locationName = 'westeurope'
Get-AzureRmLocation
$location = Get-AzureRmLocation | Where -Property Location -Match $locationName
$locationName = ""

#Get-AzureRmSubscription -SubscriptionName $subscriptionName | Select-AzureRmSubscription

$subscription = Get-AzureRmSubscription -SubscriptionName $subscriptionName

$subscriptionName = ""

Select-AzureRmSubscription -SubscriptionId $subscription.SubscriptionId

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $location.Location `
    -Verbose -Force

# Conditionally create storage account
if ((Get-AzureRmStorageAccount | where { $_.StorageAccountName -Match $storageAccountName }).Count -eq 0) {
    New-AzureRmStorageAccount `
        -ResourceGroupName $resourceGroupName `
        -AccountName $storageAccountName `
        -SkuName Standard_LRS `
        -Kind Storage `        -Location $location.Location `
        -Verbose
}

Set-AzureRmCurrentStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName

Write-Host "Initiate Azure CLI!"
azure

cls
Write-Host "The following is the context that we are working under now!"
$azureRmContext = (Get-AzureRmContext) -as [Microsoft.Azure.Commands.Profile.Models.PSAzureContext]
$azureRmContext

function RemoveResourceGroup()
{
    Get-Job | Where { $_.State -ne "Running" } | Remove-Job

    Write-Host "Deleting the Resource Group '$resourceGroupName' in the background!"

    $arguments = ($azureCredential, $subscription, $resourceGroupName)
    $scriptBlock = { 
        Login-AzureRmAccount -Credential $args[0] 
        Select-AzureRmSubscription -SubscriptionId $args[1].SubscriptionId
        Remove-AzureRmResourceGroup -Name $args[2] -Force
    }

    $fireAndForget = Start-Job -ScriptBlock $scriptBlock -ArgumentList $arguments
}
