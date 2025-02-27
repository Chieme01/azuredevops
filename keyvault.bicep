param location string = 'West US'
param keyVaultName string = 'devtest-k8-keyvault-4'
param group_prefix string = 'devtest-k8'
param objectId string = '9e3ebc64-373b-4818-95da-4137516f76ab'

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enabledForTemplateDeployment: true
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: objectId
        permissions: {
          keys: [
            'get'
            'list'
            'create'
            'delete'
          ]
          secrets:[
            'get'
            'list'
            'set'
            'delete'
            'recover'
            'backup'
            'restore'
          ]
          storage:[
            'get'
          ]
        }
      }
    ]
    enableSoftDelete: false
    softDeleteRetentionInDays: 7
    //enablePurgeProtection: true
  }
}

output keyvaultid string = keyVault.id
output keyvaultname string = keyVault.name
output kv_tenant string = keyVault.properties.tenantId

resource sshPrivateSecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  parent: keyVault
  name: 'sshPrivateKey'
  properties: {
    value: ''
  }
}

resource sshPublicSecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  parent: keyVault
  name: 'sshPublicKey'
  properties: {
    value: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRT0CBBfsaZDtOJLgbmiZZPpq2kJO+knXCYaMhTQO9FonzVNV1gJygbyIkBW+ZPqLKGHLpwoQzzNBNQgKvORB3bdyMw5wX8kLZN8GjOPM2pnnhCLywLlR9OsLzNkGl0LRV7FRlMS6PbHpaxjC/2/+gR67ekWvnaVoA0PKLnrKh3QCILXcTgAWgaccQrEL0rlIHbbr3M1ZiuDtxPNHctcQGH6aH/SuG1dwbL3A8ouwkIACwHzwqYwn1SVutQWjA2FUNJsD3OHPQUxzeqJ49rW8Y62LB7T8kLaCbNi+4wkwCCHMDUwf7HzYAn4vCmGIFh7XcPBwwtkgez1dPHyH7g7Cl vsts@fv-az419-710'
  }
}

resource SendGridApiKey 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  parent: keyVault
  name: 'SendGridApiKey'
  properties: {
    value: 'this_is_a_fake_send_grid_api_key'
  }
}
