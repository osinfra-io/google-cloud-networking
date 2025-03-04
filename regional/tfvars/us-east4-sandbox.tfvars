remote_bucket = "plt-lz-networking-4312-sb"

subnets = {
  "plt-us-east4-a" = {
    ip_cidr_range          = "10.62.24.0/21"
    pod_ip_cidr_range      = "10.6.0.0/15"
    services_ip_cidr_range = "10.63.16.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "plt-us-east4-b" = {
    ip_cidr_range          = "10.62.32.0/21"
    pod_ip_cidr_range      = "10.8.0.0/15"
    services_ip_cidr_range = "10.63.24.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }

  "plt-us-east4-c" = {
    ip_cidr_range          = "10.62.40.0/21"
    pod_ip_cidr_range      = "10.10.0.0/15"
    services_ip_cidr_range = "10.63.32.0/21"
    service_project_number = "362793201562" # plt-k8s-tf39-sb
  }
}
