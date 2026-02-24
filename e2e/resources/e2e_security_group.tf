resource "e2e_security_groups" "web_sg" {
  name        = "web-sg"
  location    = "Delhi"
  project_id  = "42914" 
  description = "Web Tier Security Group"
  default     = false

  rules{
      rule_type     = "Inbound"
      protocol_name = "Custom_TCP"
      port_range    = "80"
      network       = "myNetwork"
      network_cidr  = "vpc_4012" #provide your network_cidr. Find the format below in optional feilds.
      size          = 24
      description   = "Allow HTTP traffic"
    }

    rules{
      rule_type     = "Outbound"
      protocol_name = "All"
      port_range    = "All"
      network       = "any"
      description   = "Allow all outbound"
    }

}