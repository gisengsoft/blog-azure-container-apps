# Carrega credenciais de um arquivo não versionado
if (Test-Path -Path ".\secrets.ps1") {
    . .\secrets.ps1
} else {
    Write-Error "Arquivo secrets.ps1 não encontrado. Crie este arquivo com suas credenciais."
    exit 1
}

# Definir variáveis
$resourceGroup = "conteinerappsblog01"
$location = "eastus"
$environment = "blog-gilson-silva-env"
$appName = "blog-gilson-silva-app"
$acrName = "bloggilsonsilvaacr"

# Comandos para criar recursos no Azure
Write-Host "Criando grupo de recursos..."
az group create --name $resourceGroup --location $location

Write-Host "Fazendo login no ACR..."
az acr login --name $acrName

Write-Host "Construindo e enviando imagem Docker..."
az acr build --registry $acrName --image $appName:latest .

Write-Host "Criando ambiente Container Apps..."
az containerapp env create --name $environment --resource-group $resourceGroup --location $location

Write-Host "Implantando aplicação..."
az containerapp create --name $appName --resource-group $resourceGroup --environment $environment --image "$acrName.azurecr.io/$appName:latest" --target-port 80 --ingress external --registry-server "$acrName.azurecr.io" --registry-username $ACR_USERNAME --registry-password $ACR_PASSWORD

Write-Host "Implantação concluída!"