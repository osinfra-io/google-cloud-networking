# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/google-cloud-services/assets/1610100/59b781d4-46a3-4c57-b5ac-200de6bf8e76"> Google Cloud Platform - Services

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-services/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-services/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/4d30a203-d962-4493-b0b0-f7c0a0e4e3ad/branch/6562dbbd-1739-443e-be35-baba352f28f4)](https://dashboard.infracost.io/org/osinfra-io/repos/4d30a203-d962-4493-b0b0-f7c0a0e4e3ad?tab=settings)

## Repository Description

This repository creates a common services layer that aligns with our [Google Cloud landing zone platform](https://docs.osinfra.io/google-cloud-platform/landing-zone) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment.

## <img align="left" width="35" height="35" src="https://user-images.githubusercontent.com/1610100/209340481-2a74c148-f10d-4192-8eae-c88645663824.png"> Team Topologies

>Simple but comprehensive information for the platform provides a single point of entry for anyone wanting to know more about the services, report an issue or find out the current status, roadmap, and so on. - [Team Topologies: Thin Platform Template](https://github.com/TeamTopologies/Thin-Platform-template)

### Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/google-cloud-platform/landing-zone/google-cloud-services)
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

### Terraform Documentation

- [global](global/infra/README.md)
- [regional](regional/infra/README.md)
