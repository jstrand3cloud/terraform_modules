# Introduction 
Creates a Firewall with the following naming convention: fw-(application_name)-(subscription_type)-(instance_number). Note name be be overridden by supplying an alternate name via the firewall_name_override parameter.

Exp: fw-myapp-dev-001

# Parameters
| Variable      | Description |
| :---        |    :----   |
| application_name      | Application or Service name used to build the Firewall name       |
| subscription_type   | Subscription type used to build the Firewall name        |
| instance_number   | Instance number used to build the Firewall name        |
| location   | The Azure Region where the Firewall should exist.        |
| sku_name   | (Required) SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet. Changing this forces a new resource to be created.        |
| sku_tier   | (Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional.        |
| threat_intel_mode   | (Optional) The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert,Deny and "" (empty string). Defaults to Alert        |
| zones  | (Optional) A collection containing the availability zone to allocate the Public IP in.        |
| ipc_name   | Specifies the name of the IP Configuration.     |
| ipc_subnet_id   | Reference to the subnet associated with the IP Configuration.     |
| ipc_pip_id   |  The ID of the Public IP Address associated with the firewall.     || tags   | (Optional) A mapping of tags to assign to the resource.     |
| firewall_name_override   |  (Optional) Explicitly override the module generated name.        |
| firewall_policy_id   |  Firewall policy id.        |

# Outputs
| Output      | Description |
| :---        |    :----   |
| id   | The ID of this Firewall. |
| ip_configuration   | A ip_configuration block. |
| virtual_hub   |  A virtual hub block |