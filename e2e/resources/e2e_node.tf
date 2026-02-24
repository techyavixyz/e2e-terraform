 resource "e2e_node" "node1" {
    name               = "node_name"
    location           = "Delhi"
    plan               = "C3.8GB"
    image              = "Ubuntu 24.04 x86_64"
    project_id         = 13654
    security_group_ids = [10001
 }