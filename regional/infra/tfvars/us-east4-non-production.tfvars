environment = "non-production"

kubernetes_service_projects = {
  "plt-k8s-tf33-nonprod" = {
    number = 1036446604184
  }
}

region        = "us-east4"
remote_bucket = "plt-lz-networking-3bfe-nonprod"

subnets = {
  "services" = {
    ip_cidr_range          = "10.60.16.0/20"
    master_ip_cidr_range   = "10.61.224.16/28"
    pod_ip_cidr_range      = "10.4.0.0/14"
    services_ip_cidr_range = "10.61.0.0/20"
  }
}
