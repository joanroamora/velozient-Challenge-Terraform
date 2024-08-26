output "web_vm_ids" {
  value = azurerm_virtual_machine.web_vm.*.id
}

output "app_vm_id" {
  value = azurerm_virtual_machine.app_vm.id
}
