module "vpc_marketing" {
  source   = "./vpc"
  env_name = "marketing"
  zone     = var.zone_a
  cidr     = "10.0.1.0/24"
}

module "vpc_analytics" {
  source   = "./vpc"
  env_name = "analytics"
  zone     = var.zone_b
  cidr     = "10.0.2.0/24"
}
