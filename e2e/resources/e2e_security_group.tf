resource "e2e_security_groups" "this" {
  count = var.security_group.create ? 1 : 0

  name        = var.security_group.name
  location    = var.location
  project_id  = tostring(var.project_id)
  description = var.security_group.description
  default     = var.security_group.default

  dynamic "rules" {
    for_each = var.security_group.rules

    content {
      rule_type     = rules.value.rule_type
      protocol_name = rules.value.protocol_name
      port_range    = rules.value.port_range
      network       = rules.value.network
      network_cidr  = try(rules.value.network_cidr, null)
      size          = try(rules.value.size, null)
      description   = try(rules.value.description, null)
    }
  }
}
