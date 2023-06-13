# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/google-cloud-services/assets/1610100/59b781d4-46a3-4c57-b5ac-200de6bf8e76"> Google Cloud Platform - Services

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-services/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?label=Sandbox%20Infrastructure%20Global&url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7/branch/1ee44b4d-8e3f-4fc9-8c39-2a7c767cf0c8/google-cloud-audit-logging%2520-%2520Sandbox%2520Infrastructure%253A%2520Global)](https://dashboard.infracost.io/org/osinfra-io/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7) [![infracost](https://img.shields.io/endpoint?label=Non-Production%20Infrastructure%20Global&url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7/branch/1ee44b4d-8e3f-4fc9-8c39-2a7c767cf0c8/google-cloud-audit-logging%2520-%2520Non-Production%2520Infrastructure%253A%2520Global)](https://dashboard.infracost.io/org/osinfra-io/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7) [![infracost](https://img.shields.io/endpoint?label=Production%20Infrastructure%20Global&url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7/branch/1ee44b4d-8e3f-4fc9-8c39-2a7c767cf0c8/google-cloud-audit-logging%2520-%2520Production%2520Infrastructure%253A%2520Global)](https://dashboard.infracost.io/org/osinfra-io/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7)

## Repository Description

This repository creates a common services layer that aligns with our [Google Cloud landing zone platform](https://docs.osinfra.io/google-cloud-platform/landing-zone) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment.

## <img align="left" width="35" height="35" src="https://user-images.githubusercontent.com/1610100/209340481-2a74c148-f10d-4192-8eae-c88645663824.png"> Team Topologies

>Simple but comprehensive information for the platform provides a single point of entry for anyone wanting to know more about the services, report an issue or find out the current status, roadmap, and so on. - [Team Topologies: Thin Platform Template](https://github.com/TeamTopologies/Thin-Platform-template)

### Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/google-cloud-platform/landing-zone)
- Live status page:

### Platform Dependencies

- [google-cloud-hierarchy](https://github.com/osinfra-io/google-cloud-hierarchy): Metaphorically speaking, the [Google Cloud resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy) resembles the file system found in traditional operating systems as a way of organizing and managing entities hierarchically.
- [google-cloud-terraform-backend](https://github.com/osinfra-io/google-cloud-terraform-backend): Terraform uses persisted state data to keep track of the resources it manages. Most non-trivial Terraform configurations use a backend to store state remotely. This lets multiple people access the state data and work together on that collection of infrastructure resources.
- [google-cloud-workload-identity](https://github.com/osinfra-io/google-cloud-workload-identity): With [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation), you can use Identity and Access Management (IAM) to grant external identities IAM roles, including the ability to impersonate service accounts. This lets you access resources directly, using a [short-lived access token](https://cloud.google.com/iam/docs/create-short-lived-credentials-direct), and eliminates the maintenance and security burden associated with service account keys.

### Service Interfaces

None

### Response Times

- Responsible team: [Platform - Google Cloud Landing Zone](https://github.com/orgs/osinfra-io/teams/platform-google-cloud-landing-zone)
- Response time for incidents: `60 minutes`
- Response time for other incidents: `120 minutes`
- Response time for support:  `60 minutes`
- Response time for feedback: `30 minutes`

### Roadmap

- Link to roadmap: [GitHub Project](https://github.com/orgs/osinfra-io/projects/1/views/7)

### Communication Channels

#### To report a possible incident

Contact exclusively via:

- Discord: [Platform - Google Cloud Landing Zone](https://discord.gg/YPg4AmMDvF)
- Phone number:

#### To ask for support or provide feedback

Contact via any of these:

- Discord: [Platform - Google Cloud Landing Zone](https://discord.gg/YPg4AmMDvF)
- Email address: [platform-google-cloud-landing-zone@osinfra.io](mailto:platform-google-cloud-landing-zone@osinfra.io)
- Phone number:
- Office hours (EST): `Weekdays 5:00 PM - 10:00 PM` `Weekends 8:00 AM - 5:00 PM`

## <img align="left" width="35" height="35" src="https://user-images.githubusercontent.com/1610100/209029142-410349b7-4b22-40a9-9d4d-729f07e2b4a2.png"> Development

>Open Source Infrastructure (as code) is a development model for infrastructure that focuses on open collaboration applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down [stream-aligned](https://teamtopologies.com/key-concepts) teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/development-setup).

### Tools

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

## CIDR Blocks

The following CIDR blocks are available:

| Subnet address | VPC |
|:--------------:|:---:|
|10.0.0.0/10       | standard-shared |
|10.64.0.0/10      | free |
|10.128.0.0/10     | free |
|10.192.0.0/10     | free |

## VPC Name: `standard-shared`

> NOTE: This VPC uses the same ranges for sandbox, pre-production and production. It uses the default size for the subnet's primary IP range,
> the subnet's secondary IP range for Pods and the subnet's secondary IP range for Services.

[GKE IPAM calculator](https://googlecloudplatform.github.io/gke-ip-address-management)

We are breaking up the `10.0.0.0/10` CIDR block with the above calculator using the following inputs:

```json
{
 "network": "10.0.0.0",
 "netmask": 10,
 "nodeNetmask": 20,
 "clusterNetmask": 14,
 "serviceNetmask": 20,
 "nodePodNetmask": 24,
 "masterNetwork": "UNIQUE",
 "locationType": "REGIONAL",
 "extraZones": 1
}
```

### Kubernetes Info

*NOTES: A Kubernetes [VPC-native cluster](https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips) uses [secondary ranges](https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips#cluster_sizing_secondary_range_pods) for Pods & Services.*

**The maximum number of Pods and Services for a given GKE cluster is determined by the size of the cluster's secondary ranges. The maximum number of nodes in the cluster is limited by the size of the cluster's subnet's primary IP address range and the cluster's Pod address range.**

This will give us 15 clusters and each cluster will support:

- Up to 1023 node(s) per cluster.
- Up to 4096 service(s) per cluster.
- Up to 110 pods per node.

**Master CIDR Block:**

| Subnet Address | Cluster |
|:--------------:|:-------:|
| 10.61.224.0/28 | services-us-east1 |
| 10.61.224.16/28 | services-us-east4 |
| 10.61.224.32/28 | |
| 10.61.224.48/28 | |

**Primary Ranges:**

| Subnet Address | Nodes | Name |
|:--------------:|:-----:|:----:|
| 10.60.0.0/20   | 4092  | services-k8s-us-east1 |
| 10.60.16.0/20  | 4092  | services-k8s-us-east4 |
| 10.60.32.0/20  | 4092  | |
| 10.60.48.0/20  | 4092  | |

**Secondary Pod Ranges:**

| Subnet Address | Pods | Name | Cluster |
|:--------------:|:----:|:----:|:-------:|
| 10.0.0.0/14 | 112640 | services-k8s-pods-us-east1 | services-us-east1 |
| 10.4.0.0/14 | 112640 | services-k8s-pods-us-east4 | services-us-east4 |
| 10.8.0.0/14 | 112640 | | |
| 10.12.0.0/14 | 112640 | | |

**Secondary Service Ranges:**

| Subnet Address | Services | Name | Cluster |
|:--------------:|:--------:|:----:|:-------:|
| 10.60.240.0/20 | 4096 | services-k8s-services-us-east1 | services-us-east1 |
| 10.61.0.0/20 | 4096 | services-k8s-services-us-east4 | services-us-east4 |
| 10.61.16.0/20 | 4096 | | |
| 10.61.32.0/20 | 4096 | | |

### Terraform Documentation

- [global](global/infra/README.md)
- [regional](regional/infra/README.md)
