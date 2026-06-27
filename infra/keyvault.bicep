param location string = 'uksouth'
param vaultName string = 'iac-kv'

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      name: 'standard'
      family: 'A'
    }
    accessPolicies: []
  }
}

output keyVaultUri string = keyVault.properties.vaultUri
