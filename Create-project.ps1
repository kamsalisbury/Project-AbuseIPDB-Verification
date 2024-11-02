# Variables
$rg = Read-Host "Please provide the name for the new Resource Group to host the new Static Web App..."
$location = "Central US"
Write-Host "The location is statically set to " $location

# First, create the resource group
New-AzResourceGroup -Name $rg -Location $location -Tag @{Project="Test"}

# Second, create the static web app service plan
$ghRepo = Read-Host "Which Github Repository is going to be linked to the new static web app? https://github.com/your-username/your-repo"
Write-Host "You'll need to generate a personal access token on GitHub https://github.com/settings/tokens and provide that as input so that the new static web app is linked to your Github repository."
# Prompt for user input
$ghToken = Read-Host "Input your GitHub PAT (Personal Access Token)"
$appName = Read-Host "And the name of this new static web app?" 
#New-AzStaticWebApp -ResourceGroupName $rg -Name $appName -Location $location -Sku "Free" -AppLocation "app" -ApiLocation "api" -RepositoryUrl $ghRepo -Branch "main" -RepositoryToken $ghToken -Verbose
New-AzStaticWebApp -ResourceGroupName $rg -Name $appName -Location $location -RepositoryUrl $ghRepo -RepositoryToken $ghToken -Branch 'main' -AppLocation 'Client' -ApiLocation 'Api' -OutputLocation 'wwwroot' -SkuName 'Free'
