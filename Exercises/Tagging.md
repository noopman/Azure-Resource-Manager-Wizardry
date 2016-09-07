# Azure Resource Manager Wizardry Workshop
## Use Visual Studio to Create Multiple deployments with parameters

Use one of your existing templates or create a new one with perhaps a WebApp and a WebFarm.

1. Open the file Startup.ps1 and run it step by step to learn what it does.
2. Deploy a new Resource Group with a tag:
    * New-AzureRmResourceGroup -Tag @{ Department = "RnD" } -Name $resourceGroupName -Location $location.Location
3. Append Tag:
    * Fetch Tags for the RG.
        * $tags = (Get-AzureRmResourceGroup -Name $resourceGroupName).Tags
    * Append a Tag.
        * $tags += @{ Status = "Approved" }
    * Store the Tags again.
    * Search for a Resourece Group  with one of your tags.
        * Find-AzureRmResourceGroup
    * Verify in the portal that you added tags and that the old tags are still there!
    * *Hint:* The Cheat file is in the folder "05Tagging".
4. add Tags to the template.
    * Use a hard-coded tag.
    * Use a tag from a parameter file and/or...
    * Use at least one based on a parameter or variable. Ex: "costCenter": "[parameters('costCenterTag')]"
    * Deploy it and validate the tags on the resource in the portal.
