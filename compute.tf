data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = var.public_key
  }
}

module "marketing_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name = "develop"
  # Берем данные из модуля vpc_marketing
  network_id   = module.vpc_marketing.network_id
  subnet_zones = [module.vpc_marketing.subnet_zone]
  subnet_ids   = [module.vpc_marketing.subnet_id]

  instance_name  = "marketing-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { project = "marketing" }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name = "develop"
  # Берем данные из модуля vpc_analytics
  network_id   = module.vpc_analytics.network_id
  subnet_zones = [module.vpc_analytics.subnet_zone]
  subnet_ids   = [module.vpc_analytics.subnet_id]

  instance_name  = "analytics-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { project = "analytics" }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
