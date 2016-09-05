Set-Location "$demosPath\LinkedTemplates"

$resourceGroupName = "ARMTrainingLinked"
$templateUri = "https://raw.githubusercontent.com/noopman/Azure-Resource-Manager-Wizardry/master/04LinkedTemplates/azuredeploy.json"
$templateParametersUri = "https://raw.githubusercontent.com/noopman/Azure-Resource-Manager-Wizardry/master/04LinkedTemplates/azuredeploy.parameters.json"

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location.Location `
    -Verbose -Force

New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $templateUri `
    -Verbose -Force `
    -TemplateParameterUri $templateParametersUri
          
RemoveResourceGroup
