## Prerequisites

### AWS Setup

You will need to configure AWS CLI.

- [AWS CLI Configuration basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

OR if you use AWS SSO

- [Configuring the AWS CLI to use AWS Single Sign-On](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)

Then setup Terraform.

- [Terraform AWS course - 40 min](https://learn.hashicorp.com/collections/terraform/aws-get-started)

### OR Azure Setup

You will need to configure Azure CLI.

Then setup Terraform.

- [Terraform Azure course - 40 min](https://learn.hashicorp.com/collections/terraform/azure-get-started)

> To make the terraform file generic for every juridiction. When you configure you aws or azure CLI use the :
>
> - CLI profile name: CandyDevNetwork.
> - And use the variables for your specific installation.

## Cheat Sheet
For the first boot of your terraform provisiong you need to at least "init" and "plan":
```
terraform init -var-file="environments/dev1/terraform.tfvars"
terraform plan -var-file="environments/dev1/terraform.tfvars"
```


To perform the provisiong:
```
terraform apply -var-file="environments/dev1/terraform.tfvars"
```

Ultimately if you need to destroy what was provision:
```
terraform destroy -var-file="environments/dev1/terraform.tfvars"
```