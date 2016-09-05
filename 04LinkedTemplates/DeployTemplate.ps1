Set-Location "$demosPath\LinkedTemplates"

$resourceGroupName = "ARMTrainingLinked"
$templateFile = ".\azuredeploy.json"
$templateParametersFile = ".\azuredeploy.parameters.json"

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location.Location `
    -Verbose -Force

New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -Verbose -Force
    -TemplateParameterFile $templateParametersFile

RemoveResourceGroup
