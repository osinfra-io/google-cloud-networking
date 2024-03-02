environment                     = "prod"
cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf91-prod"

dns_records_admins = [
  "plt-k8s-github@ptl-lz-terraform-tf62-prod.iam.gserviceaccount.com"
]

folder_id = "1033174574192"

public_record_sets = [
  {
    name = "nonprod"
    rrdatas = [
      "ns-cloud-b1.googledomains.com.",
      "ns-cloud-b2.googledomains.com.",
      "ns-cloud-b3.googledomains.com.",
      "ns-cloud-b4.googledomains.com."
    ]
    ttl  = 21600
    type = "NS"
  },
  {
    name = "sb"
    rrdatas = [
      "ns-cloud-e1.googledomains.com.",
      "ns-cloud-e2.googledomains.com.",
      "ns-cloud-e3.googledomains.com.",
      "ns-cloud-e4.googledomains.com."
    ]
    ttl  = 21600
    type = "NS"
  },
  {
    name = "test"
    rrdatas = [
      "ns-cloud-d1.googledomains.com.",
      "ns-cloud-d2.googledomains.com.",
      "ns-cloud-d3.googledomains.com.",
      "ns-cloud-d4.googledomains.com."
    ]
    ttl  = 21600
    type = "NS"
  }
]

vpc_service_projects = {
  "plt-k8s-tf10-prod" = {
    number = 502462287439
  }
}
