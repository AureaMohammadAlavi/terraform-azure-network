output "subnet_prefixex" {
  value = {for s in azurerm_subnet.subnet: s.name => s.address_prefixes}
}