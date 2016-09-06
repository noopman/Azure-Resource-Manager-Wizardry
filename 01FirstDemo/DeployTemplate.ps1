Set-Location "$demosPath\FirstDemo"

code .

$resourceGroupName = 'ARMTrainingBasicDemo'
$templateFile = '.\azuredeploy.json'

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location.Location `
    -Verbose -Force

New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -Verbose -Force

RemoveResourceGroup
