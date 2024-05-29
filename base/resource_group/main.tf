#This module creates a Azure resource group.
resource "azurerm_resource_group" "rg" {
  # {CLOUD PLATFORM}-{SEGMENT}-{ENVIRONMENT}-{REGION}-{APPLICATION}-{RESOURCE}-{##}
  #name     = "az-corp-${var.env}-${lower(element(split(",", lookup(var.region_mapping, var.location, "-,unknown")),1))}-${lower(element(split(",", lookup(var.app_mapping, var.business, "-,unknown")),1))}-rg" 
  name     = var.name
  location = var.location
  tags     = var.tags
}