terraform {
  required_version = ">= 1.5.0"

  required_providers {
    e2e = {
      source  = "e2eterraformprovider/e2e"
      version = "2.2.8"
    }
  }
}

provider "e2e" {
  api_key      = var.api_key
  auth_token   = var.auth_token
  api_endpoint = var.api_endpoint
}
