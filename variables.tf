variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone_a" {
  type    = string
  default = "ru-central1-a"
}

variable "zone_b" {
  type    = string
  default = "ru-central1-b"
}

variable "public_key" {
  type        = string
  description = "SSH public key for cloud-init"
}
