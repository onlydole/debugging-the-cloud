resource "azurerm_resource_group" "project" {
  name     = var.project_name
  location = var.region
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.project.name
  address_space       = "11.0.0.0/16"
  subnet_prefixes     = ["11.0.1.0/24"]
  subnet_names        = ["subnet1"]
  depends_on          = [azurerm_resource_group.project]
  tags = {
    Operator = "Terraform"
  }
}

module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.project.name
  prefix              = var.project_name
  agents_count        = 3
  vnet_subnet_id      = module.network.vnet_subnets[0]
  os_disk_size_gb     = 100
  depends_on          = [module.network]
  tags = {
    Operator = "Terraform"
  }
}
