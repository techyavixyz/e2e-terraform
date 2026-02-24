resource "e2e_ssh" "this" {
  count = var.ssh_key.create ? 1 : 0

  ssh_key_name   = var.ssh_key.name
  ssh_key_string = var.ssh_key.public_key
}
