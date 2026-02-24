 resource "e2e_vpc" "vpc1" {
    vpc_name            = "vpc_name"
    location            = "Delhi"
    project_id          = "12345"            # Replace with your actual project ID
    is_e2e_vpc          = false              # Optional, set false for custom vpc
    ipv4                = "192.168.1.0/24"   # Optional ,replace this with ipv4 cidr block you want to add
 }