resource "azurerm_private_dns_a_record" "this" {
  name                = var.a_record_name       #string
  zone_name           = var.dns_zone_name       #string
  resource_group_name = var.dns_zone_rg_name    #string
  ttl                 = var.a_record_ttl        #number Default 300
  records             = var.a_record_ip_address #list(string)

  tags = var.tags
}