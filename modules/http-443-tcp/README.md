## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_rules | A list of predefined rules for egress traffic | `list(string)` | <pre>[<br>  "all-tcp",<br>  "all-udp"<br>]</pre> | no |
| name | Name of the firewall configuration | `any` | n/a | yes |
| source\_addresses | A list of tags from which ingress traffic may originate | `any` | `null` | no |
| source\_tags | A list of tags from which ingress traffic may originate | `any` | `null` | no |
| tags | A list of tags attached to the firewall | `list(string)` | `[]` | no |

## Outputs

No output.

