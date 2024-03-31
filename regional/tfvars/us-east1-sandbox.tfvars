region        = "us-east1"
remote_bucket = "plt-lz-networking-2c8b-sb"

subnets = {
  "services-${var.region}-b" = {
    ip_cidr_range          = "10.62.0.0/21"
    master_ip_cidr_range   = "10.63.240.48/28"
    pod_ip_cidr_range      = "10.0.0.0/15"
    services_ip_cidr_range = "10.63.240.0/28"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "services-${var.region}-c" = {
    ip_cidr_range          = "10.62.8.0/21"
    master_ip_cidr_range   = "10.63.240.16/28"
    pod_ip_cidr_range      = "10.2.0.0/15"
    services_ip_cidr_range = "10.63.0.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "services-${var.region}-d" = {
    ip_cidr_range          = "10.62.16.0/21"
    master_ip_cidr_range   = "10.63.240.32/28"
    pod_ip_cidr_range      = "10.4.0.0/15"
    services_ip_cidr_range = "10.63.8.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }
}
