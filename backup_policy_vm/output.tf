output "id" {
  description = "The id of the backup policy"
  value       = element(concat(resource.azurerm_backup_policy_vm.policy.*.id, [""]), 0)
}