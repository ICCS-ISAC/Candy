# AWS-SEA


## AWS-SEA SSO Authentication before launching Terraform
### Pour initialiser un nouveau compte aws sso en command line
> To make the terraform file generic for every juridiction. When you configure you aws CLI with SSO just use and configure both profile name for the node account and the perimeter account.
>
> - AWS CLI profile name 1 : "CandyDevNetwork" <- for the dev node account
> - AWS CLI profile name 2 : "Perimeter" <- for the perimeter account
> - And use the other variables for your specific installation.

Use this command line to create both profile names the first time.
```
aws configure sso
```

### Each time your SSO session expire
Login to your profile. You can log both profile if needed.
```
aws sso login --profile CandyDevNetwork
```
```
aws sso login --profile Perimeter
```

### If you ever need to decode an error from AWS CLI
Just put your encoded message in the command line where is say's (encoded error message). 
```
aws sts decode-authorization-message --profile CandyDevNetwork --encoded-message (encoded error message) --query DecodedMessage --output text | jq '.'
```
You won't have to search for the encoded message, if you have an error it will automatically show as an encoded one.

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
