variable "resource_group_name" {
  description = "Name of the resource group for the network resources"
  type        = string
  default     = "rg-network"
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
  default     = "uksouth"
}

variable "vnet_cidr_block" {
  description = "CIDR block for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets, one per subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets, one per subnet"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
