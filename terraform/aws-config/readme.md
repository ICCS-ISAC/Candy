# Cloud Security Guardrails Conformance Pack

> **_NOTE:_** Variables for use with this project are managed in Terraform Cloud (TF Cloud) workspaces via the [`meta`](../meta/readme.md) project.  This example takes into account that you are using Terraform Cloud.  If not, simply modify the provider.tf file to reflect your setup.

This Terraform project contains a set of guardrails in the form of a AWS Config Conformance Pack which is intended to be deployed to the management account of your organization in order to propagate the rules across all of the accounts in your organization.  It assumes AWS Config has been enabled and configured on each account in your organization already.

The AWS Cloud Security Guardrails Conformance Pack is made up of a subset of the AWS Config rules associated with the security best practices and recommendations adopted by the BC Government's OCIO from the following sources:
- [AWS Foundational Security Best Practices controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html)
- [CIS AWS Foundations Benchmark controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html)
- [CIS AWS Foundations Benchmark security checks that are not supported in Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-cis-checks-not-supported.html)

# Cheat Sheet

## List Workspaces

```
terraform workspace list
```

## Switch Workspaces

```
terraform workspace select <workspace_name>
```

## Apply the Configuration

```
terraform apply
```