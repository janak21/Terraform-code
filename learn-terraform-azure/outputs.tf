#Get resource id and store in the resource id output
output "resource_id" {
  value = azurerm_resource_group.rg.id
}