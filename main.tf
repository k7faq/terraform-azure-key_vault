resource "azurerm_resource_group" "key_vault" {
  name     = "${var.name}-rg"
  location = "${var.location}"
}

resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.name}"
  resource_group_name         = "${var.resource_group}"
  location                    = "${var.location}"
  enabled_for_disk_encryption = true
  tenant_id                   = "${var.tenant_id}"
  depends_on                  = ["azurerm_resource_group.key_vault"]

  sku_name = "${var.sku_name}"

  tags = "{var.tags}"
}
