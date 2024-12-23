datadog_enable = false

dns_records_admins = [
  "plt-k8s-github@plt-lz-terraform-tf00-sb.iam.gserviceaccount.com"
]

private_record_sets = [
  {
    name    = "test"
    rrdatas = ["192.168.1.1"]
    ttl     = 300
    type    = "A"
  }
]

project_cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf92-sb"
project_folder_id                       = "13103602325"

vpc_service_projects = {
  "plt-k8s-tf39-sb" = {
    number = 362793201562
  }
}
