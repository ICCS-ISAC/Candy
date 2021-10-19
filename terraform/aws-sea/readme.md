# AWS-SEA

> To make the terraform file generic for every juridiction. When you configure you aws CLI use or configure both profile name :
>
> - AWS CLI profile name 1 : CandyDevNetwork for the dev node
> - AWS CLI profile name 2 :
> - And use the variables for your specific installation.

## Deployment
### Deploy the validator node:
```
terraform init --upgrade
terraform plan -var-file="environments/dev1/terraform.tfvars"
terraform apply -var-file="environments/dev1/terraform.tfvars"
```

Ultimately if you need to destroy what was provision:
```
terraform destroy -var-file="environments/dev1/terraform.tfvars"
```

### Deploy the perimeter load balancer:
```
terraform init --upgrade
terraform plan -var-file="environments/perimetre/terraform.tfvars"
terraform apply -var-file="environments/perimetre/terraform.tfvars"
```

Ultimately if you need to destroy what was provision:
```
terraform destroy -var-file="environments/perimetre/terraform.tfvars"
```
