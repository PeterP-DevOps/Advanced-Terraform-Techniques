variable "env_name" {
  type        = string
  description = "VPC name"
}

variable "zone" {
  type        = string
  description = "Availability zone"
}

variable "cidr" {
  type        = string
  description = "VPC subnet CIDR"
}
