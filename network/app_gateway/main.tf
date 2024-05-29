resource "azurerm_public_ip" "appgw_public_ip" {
  name                         = "app-gw-public-ip-001"
  location                     = var.location
  resource_group_name          = var.rg_name
  domain_name_label            = "demo-storage"
  allocation_method    = "Dynamic"
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  zones               = var.availability_zones
  tags                = var.tags

  sku {
    name = var.sku_name
    tier = var.sku_tier
  }


  dynamic "backend_address_pool" {
    for_each = var.backend_address_pools
    content {
      name = backend_address_pool.key
      #fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip_addresses
    }
  }

  dynamic "probe" {
    for_each = var.probes
    content {
      interval                                  = 30
      name                                      = probe.key
      path                                      = probe.value.path
      protocol                                  = probe.value.is_https ? "Https" : "Http"
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
      host                                      = probe.value.host

      match {
        status_code = probe.value.match_status_code
      }
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                                = backend_http_settings.key
      cookie_based_affinity               = "Disabled"
      affinity_cookie_name                = "ApplicationGatewayAffinity"
      port                                = backend_http_settings.value.is_https ? "443" : "80"
      protocol                            = backend_http_settings.value.is_https ? "Https" : "Http"
      request_timeout                     = 30
      probe_name                          = backend_http_settings.value.probe_name
      pick_host_name_from_backend_address = backend_http_settings.value.pick_host_name_from_backend_address
      #trusted_root_certificate_names      = backend_http_settings.value.trusted_root_ca
      #host_name                           = backend_http_settings.value.host_name
    }
  }

  frontend_ip_configuration {
    name                 = "appGwPublicFrontendIp"
    public_ip_address_id = azurerm_public_ip.appgw_public_ip.id
  }

  frontend_port {
    name = "Https_443"
    port = 443
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  dynamic "http_listener" {
    for_each = var.http_listeners
    content {
      name                           = http_listener.key
      frontend_ip_configuration_name = "appGwPrivateFrontendIp"
      frontend_port_name             = http_listener.value.ssl_certificate_name != null ? "Https_443" : "Http_80"
      protocol                       = http_listener.value.ssl_certificate_name != null ? "Https" : "Http"
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      host_name                      = http_listener.value.host_name
    }
  }

  // Basic Rules
  dynamic "request_routing_rule" {
    for_each = var.basic_request_routing_rules
    content {
      name                       = request_routing_rule.key
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      #priority                   = request_routing_rule.value.priority

    }
  }



  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name     = ssl_certificate.key
      data     = ssl_certificate.value.data
      password = ssl_certificate.value.password
    }
  }
}
