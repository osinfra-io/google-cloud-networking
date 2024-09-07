environment   = "production"
region        = "us-east4"
remote_bucket = "plt-lz-networking-e194-prod"

subnets = {
  "plt-us-east4-a" = {
    ip_cidr_range          = "10.62.24.0/21"
    master_ip_cidr_range   = "10.63.240.48/28"
    pod_ip_cidr_range      = "10.6.0.0/15"
    services_ip_cidr_range = "10.63.16.0/21"
    service_project_number = "502462287439" # plt-k8s-tf10-prod
  }

  "plt-us-east4-b" = {
    ip_cidr_range          = "10.62.32.0/21"
    master_ip_cidr_range   = "10.63.240.64/28"
    pod_ip_cidr_range      = "10.8.0.0/15"
    services_ip_cidr_range = "10.63.24.0/21"
    service_project_number = "502462287439" # plt-k8s-tf10-prod
  }

  "plt-us-east4-c" = {
    ip_cidr_range          = "10.62.40.0/21"
    master_ip_cidr_range   = "10.63.240.80/28"
    pod_ip_cidr_range      = "10.10.0.0/15"
    services_ip_cidr_range = "10.63.32.0/21"
    service_project_number = "502462287439" # plt-k8s-tf10-prod
  }
}
