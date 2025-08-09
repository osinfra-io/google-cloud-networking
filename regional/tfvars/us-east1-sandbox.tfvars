remote_bucket = "plt-lz-networking-0bf7-sb"

subnets = {
  "plt-us-east1-b" = {
    ip_cidr_range          = "10.62.0.0/21"
    pod_ip_cidr_range      = "10.0.0.0/15"
    services_ip_cidr_range = "10.62.248.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "plt-us-east1-c" = {
    ip_cidr_range          = "10.62.8.0/21"
    pod_ip_cidr_range      = "10.2.0.0/15"
    services_ip_cidr_range = "10.63.0.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "plt-us-east1-d" = {
    ip_cidr_range          = "10.62.16.0/21"
    pod_ip_cidr_range      = "10.4.0.0/15"
    services_ip_cidr_range = "10.63.8.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }
}
