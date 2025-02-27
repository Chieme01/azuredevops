// main.bicep

param keyVaultName string = 'devtest-k8-keyvault-4'
param secretName string = 'sshPublicKey'
//param tenantId string
//param clientId string
//@secure()
//param clientSecret string

resource existing_keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: keyVaultName
}

module vnet './vnet.bicep' = {
  name: 'vnetdeployment'  
}

module aks './aks.bicep' = {
    name: 'aksdeployment'
    params: {
      vnetSubnetID: vnet.outputs.private_subnetId
      keydata: existing_keyVault.getSecret(secretName)
      keyVaultName: keyVaultName
      tenantId: existing_keyVault.properties.tenantId
    }    
}

/* module firewall './firewall.bicep' = {
  name: 'firewalldeployment'
  params: {
    virtualNetworkName: vnet.outputs.vnetname
  }    
}
 */

/*  module storage './storage.bicep' = {
  name: 'storagedeployment'    
} */
