output "location" {
  value = azurerm_resource_group.network.location
}

output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "private_subnet_ids" {
  value = azurerm_subnet.private[*].id
}

output "public_subnet_ids" {
  value = azurerm_subnet.public[*].id
}

output "lb_nsg_id" {
  value = azurerm_network_security_group.lb.id
}

output "app_nsg_id" {
  value = azurerm_network_security_group.app.id
}
