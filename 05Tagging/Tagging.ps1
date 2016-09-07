Set-Location "$demosPath\Tagging"

$resourceGroupName = "{yourRgName}"
#$resourceGroupName = "ARMTrainingTagging"

New-AzureRmResourceGroup -Tag @{ Department = "RnD" } -Name $resourceGroupName -Location $location.Location

#(Get-AzureRmResource -ResourceName mywebapp -ResourceGroupName $RGName).Tags

Find-AzureRmResourceGroup -Tag @{ Department = "RnD" }

Set-AzureRmResourceGroup -Name $resourceGroupName -Tag @{ Environment = 'Production' }
Find-AzureRmResourceGroup -Tag @{ Department = "RnD" }

$tags = (Get-AzureRmResourceGroup -Name $resourceGroupName).Tags
$tags += @{ Status = "Approved" }
$tags += @{ Department = "RnD" }

Set-AzureRmResourceGroup -Name $resourceGroupName -Tag $tags
Find-AzureRmResourceGroup -Tag @{ Department = "RnD" }

$templateFile = '.\azuredeploytags.json'

New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -Verbose -Force

RemoveResourceGroup
