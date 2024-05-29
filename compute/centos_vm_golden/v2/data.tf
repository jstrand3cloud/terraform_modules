# data "template_file" "linux-vm-cloud-init" {
#   template = file("app_userdata.tpl")
#   vars = {
#     hostname = var.vm_name
#     domain_join_password = var.domain_join_password
#   }
# }