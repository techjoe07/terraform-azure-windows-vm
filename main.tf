terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-practice-windows-vm"
  location = "East US"
}

# Call local module
module "windows_vm" {
  source = "./modules"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = "WinPracticeVM"
  vm_size             = "Standard_D2als_v7"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd123456!" # Ensure strong password compliance
}

# Expose Public IP output at root level
output "windows_vm_public_ip" {
  description = "Public IP address of the deployed Windows VM"
  value       = module.windows_vm.public_ip_address
}
