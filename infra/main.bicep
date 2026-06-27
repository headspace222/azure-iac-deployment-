param location string = 'uksouth'

module network './network.bicep' = {
  name: 'network'
  params: {
    location: location
  }
}

module compute './compute.bicep' = {
  name: 'compute'
  params: {
    location: location
  }
}

module keyvault './keyvault.bicep' = {
  name: 'keyvault'
  params: {
    location: location
  }
}
