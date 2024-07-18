# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/google-cloud-networking/assets/1610100/59b781d4-46a3-4c57-b5ac-200de6bf8e76"> Google Cloud Platform - Networking

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-networking/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-networking/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-networking/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7/branch/1ee44b4d-8e3f-4fc9-8c39-2a7c767cf0c8)](https://dashboard.infracost.io/org/osinfra-io/repos/f0cb1c98-ae8e-48c8-9cbe-8f00a8901fd7?tab=settings)

💵 Monthly estimates based on Infracost baseline costs.

## 📄 Repository Description

This repository manages networking resources like VPC, subnet, DNS, and NAT that can be shared across an organization. It aligns with our [Google Cloud landing zone platform](https://docs.osinfra.io/product-guides/google-cloud-platform/landing-zone) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment.

## 🏭 Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/product-guides/google-cloud-platform/landing-zone/google-cloud-networking)
- Service Interfaces: [github.com](https://github.com/osinfra-io/google-cloud-networking/issues/new/choose)

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [checkov](https://github.com/bridgecrewio/checkov)
- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [vpc](https://cloud.google.com/vpc/docs)
- [shared-vpc](https://cloud.google.com/vpc/docs/shared-vpc)
- [subnets](https://cloud.google.com/vpc/docs/subnets)

### 📓 Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### 📓 Terraform Regional Documentation

- [regional](regional/README.md)
