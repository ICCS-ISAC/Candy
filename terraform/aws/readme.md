# Terraform AWS

Terraform scripts for managing the resources associated with an Indy-Node node within a given AWS account.

Variables for use with this project are managed in Terraform Cloud (TF Cloud) workspaces via the [`meta`](../meta/readme.md) project.

# Cheat Sheet

## List Workspaces

```
terraform workspace list
```

## Switch Workspaces

```
terraform workspace select <workspace_name>
```

## Get Ansible Inventory

```
terraform output -raw ansible_inventory
```

## Refresh Output

```
terraform apply -refresh-only
```