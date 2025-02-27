// storageAccount.bicep

param storageAccountName string = 'devtestk8sa'
param location string = resourceGroup().location
param skuName string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountId string = storageAccount.id
