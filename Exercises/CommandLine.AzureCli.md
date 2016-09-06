# Azure Resource Manager Wizardry Workshop
## Use Visual Studio to Create Multiple deployments with parameters

Use the same template and parameter file that you created in the previous exercise.

1. Launch PowerShell as Administrator.
2. Type: azure
    * You should get some nice ascii art
3. Type: azure help
    * Learn about the commands in Azure CLI.
4. Type: azure login
    * Complete the login process
5. Type: 
    * azure config mode arm
    * azure config list
    * You probably don't really need this but it's good to know.
6. If you have more than one subscription:
    * Type azure account set {subscriptionName} to set your subscription of choice.
7. Type: azure account show
8. Figure out which command "creates" a Resource Group.
    * hint: azure help {command}
    * Create a resource group.
9. Figure out which command you use to "create" a "deployment".
    * What parameters do you need?
    * Make a deployment
    * Verify it in portal.azure.com
10. azure group delete -n {resource-group}

**Note:** The file \02AzureCLI\AzureCLIDemoAttendees.ps1 contains most of this but it's more useful to not cheat until after you have completed 1-10.