# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/google-cloud-services/assets/1610100/59b781d4-46a3-4c57-b5ac-200de6bf8e76"> Google Cloud Platform - Services

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-services/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/4d30a203-d962-4493-b0b0-f7c0a0e4e3ad/branch/6562dbbd-1739-443e-be35-baba352f28f4)](https://dashboard.infracost.io/org/osinfra-io/repos/4d30a203-d962-4493-b0b0-f7c0a0e4e3ad?tab=settings)

## Repository Description

This repository manages resources like VPC, subnet, DNS, Kubernetes, and other common resources that can be shared across an organization. It aligns with our [Google Cloud landing zone platform](https://docs.osinfra.io/product-guides/google-cloud-platform/landing-zone) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment.

## 🏭 Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/product-guides/google-cloud-platform/landing-zone/google-cloud-shared-resources)
- Service Interfaces: [github.com](https://github.com/osinfra-io/google-cloud-shared-resources/issues/new/choose)

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [vpc](https://cloud.google.com/vpc/docs)
- [subnets](https://cloud.google.com/vpc/docs/subnets)

### 📓 Terraform Documentation

- [global](global/infra/README.md)
- [regional](regional/infra/README.md)
