output "ssh_key_id" {
  description = "Created SSH key ID."
  value       = try(e2e_ssh.this[0].id, null)
}

output "vpc_id" {
  description = "Created VPC ID."
  value       = try(e2e_vpc.this[0].vpc_id, null)
}

output "security_group_id" {
  description = "Created security group ID."
  value       = try(e2e_security_groups.this[0].security_group_id, null)
}

output "node_id" {
  description = "Created node ID."
  value       = try(e2e_node.this[0].id, null)
}

output "kubernetes_id" {
  description = "Created Kubernetes cluster ID."
  value       = try(e2e_kubernetes.this[0].id, null)
}
