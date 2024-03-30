kubernetes_service_projects = {
  "plt-k8s-tfb4-sb" = {
    number = 102727685445
  }
}

region        = "us-east1"
remote_bucket = "plt-lz-networking-2c8b-sb"

subnets = {
  "services" = {
    ip_cidr_range          = "10.60.0.0/20"
    master_ip_cidr_range   = "10.61.224.0/28"
    pod_ip_cidr_range      = "10.0.0.0/14"
    services_ip_cidr_range = "10.60.240.0/20"
  }
}
