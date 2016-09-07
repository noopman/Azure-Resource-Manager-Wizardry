Set-Location "$demosPath\Functions"

$resourceGroupName = 'ARMTrainingFunctions'

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location.Location `
    -Verbose -Force

#add
$output = New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile '.\add.json'
Write-host $output.Parameters["first"].Value '+' $output.Parameters["second"].Value '=' $output.Outputs["addResult"].Value

#subtract
$output = New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile '.\subtract.json'
Write-host $output.Parameters["first"].Value '-' $output.Parameters["second"].Value '=' $output.Outputs["result"].Value

#What do you expect here? Each result is unique?
$output = New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile '.\uniqueString.json'
Write-host $output.Outputs["unique1"].Value
Write-host $output.Outputs["unique2"].Value

RemoveResourceGroup
