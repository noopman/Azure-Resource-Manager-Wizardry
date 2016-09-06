Set-Location "$demosPath\Parameters"

$templateFile = '.\WebSite.json'

$environments = (
    ('{productionEnvironmentName}', '.\WebSite.production.Attendees.json'), 
    ('{DevelopmentEnvironmentName}',  '.\WebSite.development.Attendees.json'), 
    ('{TestEnvironmentName}', '.\WebSite.test.Attendees.json')
)

foreach ($environment in $environments) {

    New-AzureRmResourceGroup `
        -Name $environment[0] `
        -Location $Location.Location `
        -Verbose -Force

    New-AzureRmResourceGroupDeployment `
        -ResourceGroupName $environment[0] `
        -TemplateFile $templateFile `
        -Verbose -Force `
        -TemplateParameterFile $environment[1]

}

foreach ($environment in $environments) {

    $resourceGroupName = $environment[0]
    RemoveResourceGroup
}
