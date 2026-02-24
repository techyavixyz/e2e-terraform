terraform {
 required_providers {
   e2e = {
     source = "e2eterraformprovider/e2e"
     version = "2.2.8"
   }
 }
}

provider "e2e" {
 api_key = < your e2e api key >
 auth_token = <your e2e auth bearer token>
 api_endpoint = 
}

# node creation
resource "e2e_node" "node1" {
   #...
}