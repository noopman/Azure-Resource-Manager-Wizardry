Set-Location $demosPath

azure

azure login

azure config mode arm
azure config list

$subscriptionName = '{your subscription name}'
azure account set $subscriptionName

azure account show

$azurecliRGName = 'ARMTrainingAzureCLI'
$azurecliLocation = 'westeurope'
$azurecliTemplateFile = '.\WebSite.json'
$azurecliParameterFile = '.\WebSite.parameters.json'

azure group create -n $azurecliRGName -l $azurecliLocation

azure group template validate -f $azurecliTemplateFile -e $azurecliParameterFile $azurecliRGName

$azurecliDeployment = 'AzureCLIDemodeployment'

azure group deployment create -f $azurecliTemplateFile -e $azurecliParameterFile -g $azurecliRGName -n $azurecliDeployment

azure group delete -n $azurecliRGName
