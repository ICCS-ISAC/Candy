English version below
## Conditions préalables

### Configuration AWS

Vous devrez configurer l'AWS CLI.

- [Bases de la configuration de l'AWS CLI] (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

OU si vous utilisez AWS SSO

- [Configuration de l'AWS CLI pour utiliser AWS Single Sign-On](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)

Configurez ensuite Terraform.

- [Cours Terraform AWS - 40 min](https://learn.hashicorp.com/collections/terraform/aws-get-started)

### OU Configuration Azure

Vous devrez configurer Azure CLI.

Configurez ensuite Terraform.

- [Cours Terraform Azure - 40 min](https://learn.hashicorp.com/collections/terraform/azure-get-started)

> Rendre le fichier terraform générique pour chaque juridiction. Lorsque vous configurez aws ou Azure CLI, utilisez :
>
> - Nom du profil CLI : CandyDevNetwork.
> - Et utilisez les variables pour votre installation spécifique.

## Aide-mémoire
Pour le premier démarrage de votre configuration terraform, vous devez au moins "init" et "plan":
```
terraform init --upgrade
plan terraform -var-file="environments/dev1/terraform.tfvars"
```


Pour effectuer le provisionnement :
```
terraform applique -var-file="environments/dev1/terraform.tfvars"
```

En fin de compte, si vous devez détruire ce qui était prévu :
```
terraform destroy -var-file="environments/dev1/terraform.tfvars"
```
___

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
terraform init --upgrade
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

## Recommendations:
It is highly recommended to manage your environments using workspaces and to manage you workspaces and their credentials and variables using a Terraform Cloud account.  This eliminates the use of having to manage `*.tfvars` files locally and allows teams to share and utilize the same workspaces and therefore the same variables for each managed environment.