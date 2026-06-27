param location string = resourceGroup().location

@secure()
param adminPassword string

param adminUserName string = 'azureuser'

module network './network.bicep' = {
  name: 'network'
  params: {
    location: location
  }
}

module compute './compute.bicep' = {
  name: 'compute'
  params: {
    vmConfig: {
      subnetId: network.outputs.subnetId
      adminUserName: adminUserName
      adminPassword: adminPassword
    }
  }
}

module keyvault './keyvault.bicep' = {
  name: 'keyvault'
  params: {
    location: location
  }
}
