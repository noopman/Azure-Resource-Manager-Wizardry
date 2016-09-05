Set-Location "$demosPath\LinkedTemplates"

$resourceGroupName = "ARMTrainingLinked"
$templateUri = "https://raw.githubusercontent.com/noopman/Azure-Resource-Manager-Wizardry/master/04LinkedTemplates/azuredeploy.json"
$templateUri = "https://armtraining42.blob.core.windows.net/armdemo/azuredeploy.1.json"
$templateUri = "https://armtraining42.blob.core.windows.net/armdemo/azuredeploy.json"
$templateParametersUri = "https://raw.githubusercontent.com/noopman/Azure-Resource-Manager-Wizardry/master/04LinkedTemplates/azuredeploy.parameters.json"
$templateParametersUri = "https://armtraining42.blob.core.windows.net/armdemo/azuredeploy.parameters.json"

$templateUri = "https://armtraining42.blob.core.windows.net/armdemo/azuredeploy.1.json"
$templateParametersUri = "https://armtraining42.blob.core.windows.net/armdemo/azuredeploy.parameters.json"

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
