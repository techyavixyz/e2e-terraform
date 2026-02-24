variable "api_key" {
  description = "E2E Cloud API key."
  type        = string
  sensitive   = true
}

variable "auth_token" {
  description = "E2E Cloud bearer auth token."
  type        = string
  sensitive   = true
}

variable "api_endpoint" {
  description = "E2E Cloud API endpoint."
  type        = string
  default     = "https://api.e2enetworks.com"
}

variable "project_id" {
  description = "Project identifier in E2E Cloud."
  type        = number
}

variable "location" {
  description = "Deployment location/region."
  type        = string
  default     = "Delhi"
}

variable "ssh_key" {
  description = "Model for optional SSH key creation."
  type = object({
    create     = optional(bool, true)
    name       = string
    public_key = string
  })
}

variable "vpc" {
  description = "Model for VPC creation."
  type = object({
    create     = optional(bool, true)
    name       = string
    ipv4_cidr  = string
    is_e2e_vpc = optional(bool, false)
  })
}

variable "security_group" {
  description = "Model for security group and rules."
  type = object({
    create      = optional(bool, true)
    name        = string
    description = string
    default     = optional(bool, false)
    rules = list(object({
      rule_type     = string
      protocol_name = string
      port_range    = string
      network       = string
      network_cidr  = optional(string)
      size          = optional(number)
      description   = optional(string)
    }))
  })
}

variable "node" {
  description = "Model for compute node creation."
  type = object({
    create = optional(bool, true)
    name   = string
    plan   = string
    image  = string
  })
}

variable "kubernetes" {
  description = "Model for optional Kubernetes cluster creation."
  type = object({
    create = optional(bool, false)
    name   = string
    version = string
    vpc_id  = optional(string)
    subnet_id = optional(string)
    node_pools = optional(list(object({
      name           = string
      specs_name     = string
      node_pool_type = string
      worker_node    = optional(number)
      min_vms        = optional(number)
      max_vms        = optional(number)
    })), [])
  })
}
