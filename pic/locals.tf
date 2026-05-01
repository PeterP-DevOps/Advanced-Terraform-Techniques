locals {
  subnets_by_zone = {
    for k, v in yandex_vpc_subnet.subnets :
    v.zone => v.id
  }
}
