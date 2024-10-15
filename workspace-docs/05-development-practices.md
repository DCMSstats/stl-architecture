## Development practices

These are suggestions for general development best practices for creating the service.

### Deployment and Releases

The service should be deployed by a CI/CD pipeline. Deployments should not involve manual steps. This pipeline should not be in the cloud platform, as this would be a tie to a particular cloud platform that may change later, for a small amount of benefit.

The development team may want to practise Continuous Integration, with each developer merging their code into the main codebase at least once a day. The team should also ideally practise Continuous Deployment, with ready code automatically deployed to the production systems. These practices greatly help with the speed that software can be delivered. Delays that are introduced by asynchronous checks before deployment can be substantial.

To support these practices, you need robust testing to build confidence that any changes are safe, monitoring to be aware of any problems as early as possible, and feature flags (a technique that allows changes to be made to a codebase without those changes being shown to the user).

### Infrastructure

Infrastructure should be simple as possible and provisioned using an “Infrastructure as Code” tool. These tools make you record the infrastructure that the service is built on in code. This code is read by the tool which then creates the infrastructure. This makes it easier to rebuild the service (from scratch if required) and increases certainty about configuration of systems.

For Google Cloud Platform, the default is Terraform. Terraform is also a good choice as it supports the case that we need to move the service between cloud providers. Terraform is not tied to a single cloud provider.

### Environments

We will have a “production” environment that holds the infrastructure for the real service that users visit. We may also want separate environments for:

- Staging: A complete recreation of the production environment in a separate cloud account, where we can try features before enabling them in production.  
- Build and Deploy: A separate environment that runs the CI/CD pipeline and the infrastructure as code tool. These tools need a lot of access, and by having them in a separate account you can reduce the “blast radius” of any incidents.

### Monitoring and Alerting

The service should log important events and store those logs, to help with debugging problems in the service.

The service should record metrics to ensure that the service is operating correctly. These should include metrics about the infrastructure (e.g. how full is the database, how long does the database take to deal with requests), but also metrics about the operation of the service (e.g. how many registrations have been completed).

We should create alerts for any metrics that would indicate a problem in the system (e.g. no users are completing their journey). We should also alert on anything that looks like an attack (e.g. Denial of Service or Port Scanning).

### Backup and Restore

Any data should be backed up regularly. These backups should be tested regularly. Within our system this will primarily be backups of the database. A decision needs to be made about what frequency of backups should be made and kept.

### Storing Secrets

Credentials for the APIs and other systems that our service uses should be stored outside of source control, in a dedicated service like GCP Secret Manager.

### Dependencies

The software that we write, will be dependent on 3rd party packages that other bodies provide. The number of dependencies should be minimised as each dependency adds additional security considerations. Before a dependency is added to the project it should be reviewed to ensure it is being actively maintained and is trustworthy.

These dependencies should be automatically reviewed for vulnerabilities using a tool such as Dependabot. This could be configured to automatically suggest package upgrades where they are available.
