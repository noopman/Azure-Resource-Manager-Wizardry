# Replace with your values
$templateFile = '.\{yourtemplate}.json'
$templateParameterFile = '.\{yourparameters}.json'
$resourceGroupName = "{your-rg-name}"
$location = "{yourlocation}" # Get-AzureRmLocation

# Create your empty bucket!
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $location `
    -Verbose -Force

# Run the deployment to Azure
New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -Verbose -Force `
    -TemplateParameterFile $templateParameterFile

# When you are done if you like run this command:
#RemoveResourceGroup
