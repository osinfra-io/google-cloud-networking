cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf92-sb"

dns_records_admins = [
  "plt-k8s-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"
]

enable_datadog = false
folder_id      = "13103602325"

private_record_sets = [
  {
    name    = "test"
    rrdatas = ["192.168.1.1"]
    ttl     = 300
    type    = "A"
  }
]

vpc_service_projects = {
  "plt-k8s-tf39-sb" = {
    number = 362793201562
  }
}
