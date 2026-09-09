output "public_ip_address" {
  description = "The Public IP address of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.vm.public_ip_address
}

output "vm_id" {
  description = "The ID of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.vm.id
}
