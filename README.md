# ![Digital Ocean](do-logo.png) Firewall

Purpose: Provision Firewall in Digital Ocean.

Rationale: Provide templates for Digital Ocean Firewalls.

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
| tags | A list of tags attached to the firewall | `list(string)` | `[]` | no |

## Outputs

No output.

