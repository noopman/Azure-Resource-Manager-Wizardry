# Azure Resource Manager Wizardry Workshop
## Use Visual Studio to Create Multiple deployments with parameters

This will create an end to end setup for an efficient project environment.

1. Create a Local WebApp
2. Add Application Insights.
    * Instrument in code.
    * Instrument in shared html.
2. Add Template Project for site -> Provision it
3. Create a VSTS Project
4. Create a Build pipeline for RM
5. Create a Deployments Slot (view in resources.azure.com)
    * Check the Template for a WebApp with Slots.
6. Create a VSTS Deployment to the Staging slot.
7. Validate the whole chain from local, via build to Azure.
8. Ensure your Azure Subscription is controlled by your corporate AD!
    * Check the subscription admin in account.azure.com.
    * (And the name of the subscription while you're at it.)
    * Assing the subscription admin priveliges as GlobalAdmin in the AAD.
    * Assign the subscription to the corp AAD (using manage.windowsazure.com -> Settings).
    * Revoke AAD Global Admin from the subscription admin!
9. In manage.windowsazure.com Visual Studio set a connection beween your VSTS and your AAD.
    * Verify in vsts portal.
8. Create a Group of members who can access your Project.
    * Add at least one member.
    * Assign the group to the VSTS Project.
    * Assign the same croup as contributors to the Resource Group in Azure.
    * Validate with a user in the group.

Result: You have an end to end environment with build, test and Continuous Deployment. The environment is secured using your corporate resources. The ARM template ensures repeatability in provisioning.