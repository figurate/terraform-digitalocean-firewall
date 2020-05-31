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
| destination\_addresses | A list of tags which egress traffic may target | `any` | `null` | no |
| destination\_tags | A list of tags which egress traffic may target | `any` | `null` | no |
| egress\_rules | A list of predefined rules for egress traffic | `list(string)` | `[]` | no |
| ingress\_rules | A list of predefined rules for ingress traffic | `list(string)` | `[]` | no |
| name | Name of the firewall configuration | `any` | n/a | yes |
| source\_addresses | A list of tags from which ingress traffic may originate | `any` | `null` | no |
| source\_tags | A list of tags from which ingress traffic may originate | `any` | `null` | no |
| tags | A list of tags attached to the firewall | `list(string)` | `[]` | no |

## Outputs

No output.

