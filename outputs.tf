output "vm_info" {
  value = {
    marketing = module.marketing_vm
    analytics = module.analytics_vm
  }
}
