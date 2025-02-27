param location string = 'West US'
param group_prefix string = 'devtest-k8'
param kubernetesVersion string = '1.30.7'
param vmSize string = 'Standard_DS2_v2'
param agentpool_name string = 'worker-pool'
param vnetSubnetID string
param serviceCidr string = '10.0.0.0/16'
@description('''options: azure, kubenet, none''')
param networkPlugin string = 'azure'
@description('''options: azure, calico, cilium, none''')
param networkPolicy string = 'calico'
@description(''' options: 'loadBalancer', 'managedNATGateway', 'none', 
'userAssignedNATGateway', 'userDefinedRouting' ''')
param outboundType string = 'loadBalancer'
param enablePrivateCluster bool = false
@secure()
param keydata string 
param adminUserName string = 'adminUserName'
param tenantId string
param keyVaultName string
//param resourceGroup string
//param keyVaultId string
//@secure()
//param clientSecret string
//param clientId string
//var systemIdentityID = aksCluster.identity.principalId

resource existing_keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: keyVaultName
}

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: '${group_prefix}-identity'
  location: location
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  //name: guid(aksCluster.id, 'systemAssignedIdentity', 'KeyVaultAccessRoleAssignment')
  name: guid(aksCluster.id, managedIdentity.id, 'KeyVaultAccessRoleAssignment')
  scope: existing_keyVault //resourceGroup
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b86a8fe4-44ce-4948-aee5-eccb2c155cd7')  // Key Vault Secrets Officer Role
    principalId: managedIdentity.properties.principalId //aksCluster.identity.principalId
  }
}

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: '${group_prefix}-aks-cluster'
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentity.id}': {}
    }
  }
  properties: {
    kubernetesVersion: kubernetesVersion
    dnsPrefix: 'dnsprefix'
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: agentpool_name
        count: 2
        vmSize: vmSize
        osType: 'Linux'
        mode: 'System'
        vnetSubnetID: vnetSubnetID
        enableAutoScaling: true
        minCount: 1
      }
    ]
    linuxProfile: {
      adminUsername: adminUserName
      ssh: {
        publicKeys: [
          {
            keyData: keydata
          }
        ]
      }
    }
    networkProfile: {
      serviceCidr: serviceCidr
      networkPlugin: networkPlugin
      networkPolicy: networkPolicy
      outboundType: outboundType
    }
    apiServerAccessProfile: {
      enablePrivateCluster: enablePrivateCluster
    }
    addonProfiles: {
      azureKeyvaultSecretsProvider:{
        enabled: true
        config: {
          secretRotationEnabled: 'false'
          secretRotationInterval: '2m'
        }
      }
    }
  }
}

/* resource serviceConnector 'Microsoft.ServiceLinker/linkers@2022-05-01' = {
  name: 'aks_keyvault_connector'
  scope: aksCluster
  properties: {
    clientType: 'none'
    targetService: {
      type: 'AzureResource'
      id: existing_keyVault.id
      resourceProperties: {
        type: 'KeyVault'
        connectAsKubernetesCsiDriver: true
      }
    }
    authInfo: {
      authType: 'userAssignedIdentity'
      clientId: managedIdentity.properties.clientId
    }
    secretStore: {
      keyVaultId: existing_keyVault.id
    }
    scope: 'default'
  }
} */



/* resource accessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2021-04-01' = {
  parent: existing_keyVault
  //name: '${keyVaultName}/add'
  name: 'aks-system-identity-access-vault-policy'
  properties: {
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: systemIdentityID
        permissions: {
          secrets: [
            'get'
            'list'
          ]
          keys: [
            'get'
            'list'
          ]
          certificates: [
            'get'
            'list'
          ]
        }
      }
    ]
  }
} */

//output systemIdentityId string = systemIdentityID
output userAssignedIdentityId string = managedIdentity.properties.clientId
output azureKeyvaultSecretsProvider object = aksCluster.properties.addonProfiles

