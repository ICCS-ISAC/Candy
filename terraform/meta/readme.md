# Meta Project

This is a Terraform project used to populate variables into Terraform Cloud (TF Cloud) for various environment workspaces.

This project assumes it is being run within it's own `meta` (locally) (`candy-meta` in TF Cloud) workspace within TF Cloud.

The purpose is to migrate the variables from the local `.tfvars` files into TF Cloud workspaces where they can be managed and shared with other teams members along with the states for the various environments.  This is mostly do to the fact that TF Cloud does not support the use of the `-var-file=` option to inject variables from a file.

The `meta` workspace requires a `TFE_TOKEN` environment variable to be defined.  The value is a TF Cloud API token.  This variable should be setup as a sensitive variable.

List workspaces:
```
terraform workspace list
```

Show the name of the current workspace:
```
terraform workspace show
```

Select the `meta` workspace:
```
terraform workspace select meta
```
