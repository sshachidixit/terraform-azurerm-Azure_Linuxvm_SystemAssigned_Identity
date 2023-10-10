#Resource 1

resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = var.location
  
}

#Resource 2

resource "azurerm_virtual_network" "vnet" {
name = var.vnet_name
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
address_space = var.address_space


}

#Resource 3:

resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.address_prefixes
}

#Resource 4:

resource "azurerm_public_ip" "public_ip" {
    name = var.public_ip_name
    allocation_method = "Dynamic"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  
}

#Resource 5:

resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    ip_configuration {
      name = "ip1"
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.public_ip.id
      subnet_id = azurerm_subnet.subnet.id
    }
  
}

#Resource 6:

resource "azurerm_linux_virtual_machine" "linuxvm" {
    name = var.linuxvm_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    admin_username = var.admin_username
    admin_password = var.admin_password
    disable_password_authentication = false
    identity {
      type = "SystemAssigned"
    }
    network_interface_ids = [azurerm_network_interface.nic.id]
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    size = var.size
    source_image_reference {
      publisher = var.publisher
      offer = var.offer
      sku = var.sku
      version = "latest"
    }
custom_data = base64encode(local.vm_custom_data)
  
}

data "azurerm_subscription" "current" {}

data "azurerm_role_definition" "contributor" {
    name = "contributor"
  
}

#Resource 7

resource "azurerm_role_assignment" "example" {
    scope = data.azurerm_subscription.current.id
    role_definition_id = data.azurerm_role_definition.contributor.id
    principal_id = azurerm_linux_virtual_machine.linuxvm.identity[0].principal_id
  
}

#Resource 8:

resource "azurerm_network_security_group" "nsg" {
  name = "linuxvm_nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  
}

#Resource 9:
resource "azurerm_network_security_rule" "nsgrule" {
  for_each = local.nsgrule_ports_map
  name = "Rule-port-${each.value}"
  resource_group_name = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority = each.key
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = each.value
  source_address_prefix = "*"
  destination_address_prefix = "*"
  
}

#Resource 10

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [ azurerm_network_security_rule.nsgrule]
  
}