resource "e2e_node" "this" {
  count = var.node.create ? 1 : 0

  name       = var.node.name
  location   = var.location
  plan       = var.node.plan
  image      = var.node.image
  project_id = var.project_id

  security_group_ids = var.security_group.create ? [e2e_security_groups.this[0].security_group_id] : []
  vpc_id             = var.vpc.create ? e2e_vpc.this[0].vpc_id : null
  ssh_keys           = var.ssh_key.create ? [e2e_ssh.this[0].id] : []
}
