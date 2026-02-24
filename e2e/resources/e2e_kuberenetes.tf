resource "e2e_kubernetes" "this" {
  count = var.kubernetes.create ? 1 : 0

  name       = var.kubernetes.name
  version    = var.kubernetes.version
  project_id = var.project_id
  location   = var.location

  vpc_id             = coalesce(try(var.kubernetes.vpc_id, null), try(e2e_vpc.this[0].vpc_id, null))
  security_group_ids = var.security_group.create ? [e2e_security_groups.this[0].security_group_id] : []
  subnet_id          = try(var.kubernetes.subnet_id, null)

  dynamic "node_pools" {
    for_each = var.kubernetes.node_pools

    content {
      name           = node_pools.value.name
      specs_name     = node_pools.value.specs_name
      node_pool_type = node_pools.value.node_pool_type
      worker_node    = try(node_pools.value.worker_node, null)
      min_vms        = try(node_pools.value.min_vms, null)
      max_vms        = try(node_pools.value.max_vms, null)
    }
  }
}
