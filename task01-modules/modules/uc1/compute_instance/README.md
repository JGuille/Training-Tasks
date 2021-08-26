# Usage

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | A unique name for the resource, required by GCE. Changing this forces a new resource to be created. | `string` | `NA` | yes |
| machine\_type | The machine type to create. | `string` | `NA` | yes |
| zone | The zone that the machine should be created in. If it is not provided, the provider zone is used. | `string` | `default` | no |
| tags |  A list of network tags to attach to the instance. | `string` | `[]` | no |
| boot_disk | The boot disk for the instance. | `list(map(string))` | `NA` | yes |
| metadata | Metadata key/value pairs to make available from within the instance. Ssh keys attached in the Cloud Console will be removed. Add them to your config in order to keep them attached to your instance. | `Depending on the OS` | `NA` | no |
| network_interface | Multiples network attributes | `list(map(string))` | `NA` | yes |

### Configure a Service Account
In order to execute this module you must have a Service Account with the following roles:

- compute.disks.create
- compute.firewalls.get
- compute.instances.create
- compute.instances.delete
- compute.instances.get
- compute.instances.setMetadata
- compute.instances.setServiceAccount
- compute.instances.setTags
- compute.subnetworks.use
- compute.subnetworks.useExternalIp
- compute.zones.get

Startup Script can be found under compute_instance/startup.sh

- [More information](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#tags)