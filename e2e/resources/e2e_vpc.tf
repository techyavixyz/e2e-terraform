resource "e2e_vpc" "this" {
  count = var.vpc.create ? 1 : 0

  vpc_name   = var.vpc.name
  location   = var.location
  project_id = tostring(var.project_id)
  is_e2e_vpc = var.vpc.is_e2e_vpc
  ipv4       = var.vpc.ipv4_cidr
}
