 resource "e2e_kubernetes" "kubernetes1" {
    name                = "kubernetes_cluster_v1"
    version             = "1.30"  //Just an example
    project_id          = 30000   //Just an example
    location            = "Delhi"
    vpc_id              = "10001" //Just an example
    security_group_ids  = [682, 683, 684] 
    subnet_id           = "12345" 

    node_pools {
        name          = "node_pool_1"
        specs_name    = "C3.8GB"
        node_pool_type = "Static"
        worker_node   = 2
    }

    node_pools {
        name          = "node_pool_2"
        specs_name    = "C3.8GB"
        node_pool_type = "Autoscale"
        min_vms            = 2
        max_vms            = 4

        scheduled_dict {
           worker {
             scheduled_policies {
               upscale_cardinality       = 4
               upscale_recurrence        = "0 12 * * *"
               downscale_cardinality     = 2
               downscale_recurrence      = "0 2 * * *"
             }
           }
        }
    }

    node_pools {
        name          = "wnpn_v3"
        specs_name    = "C3.8GB"
        node_pool_type = "Autoscale"
        min_vms            = 2
        max_vms            = 4

        scheduled_dict {
          worker {
             scheduled_policies {
               upscale_cardinality       = 4
               upscale_recurrence        = "0 12 * * *"
               downscale_cardinality     = 2
               downscale_recurrence      = "0 2 * * *"
             }
          }
        }

        elasticity_dict {
          worker {
            period_number      = 3
            parameter      = "NETWORK_TRAFFIC"
            policy_paramter_type = "Custom"
            elasticity_policies {
               operator       = ">"
               value          = 60
               period         = 10
              watch_period   = 3
              cooldown       = 150
            }
           elasticity_policies {
               operator       = "<"
               value          = 30
               period         = 10
               watch_period   = 3
               cooldown       = 150
           }
         }
       }
    }
 } 