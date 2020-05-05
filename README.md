## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| digitalocean | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_rules | A list of predefined rules for egress traffic | `list(string)` | `[]` | no |
| ingress\_rules | A list of predefined rules for ingress traffic | `list(string)` | `[]` | no |
| name | Name of the firewall configuration | `any` | n/a | yes |

## Outputs

No output.

