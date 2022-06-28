English version below
# Candy

## Candy : Initiative pancanadienne sur une chaîne de blocs Hyperledger Indy

Que peut-on trouver dans ce dépôt :
- Documents sur la façon d'installer un nœud indy - [Steward Validator](doc/NodeInstallation)
- Code pour provisionner le nœud indy IaaS avec [terraform](terraform/)
- Code pour installer et configurer le nœud indy avec [ansible](ansible/indy_node)
- Informations nécessaires pour connecter les différents utilisateurs pancanadiens
- Test

___

## Candy : Pan Canadian Hyperledger Indy Blockchain Initiative

What can be found in this repo:
- Code to provision IaaS indy node with [terraform](terraform/)
- Code to install and configure the indy node with [ansible](ansible/)
- Additional documents on how to install an indy node - [Steward Validator](doc/node-installation/)
- Information needed to connect the various pan-Canadian users

## Using the Terraform and Ansible scripts in this repository
The preferred method for working with the Terraform and Ansible scripts contained in this repository is to host the code in the project's Visual Studio devContainer.  The container has Terraform and Ansible installed and ready to use, there is no need to install either on your local machine.

### What you need:
- Git
- Visual Studio Code with the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension installed.
- This project cloned to your local machine.
- You should also have a Terraform Cloud account setup to manage your credentials and variables needed for your given environments.  This project contains a [terraform/meta](terraform/meta/) project to help you populate your Terraform Cloud workspaces.

### How to start:
- Clone the project.
- Open the project in Visual Studio Code.  You will be prompted to reopen the project in a container.
- Select **Reopen in Container** when prompted.
- Open an integrated terminal window and navigate to the desired Terraform or Ansible directory to start using the scripts.
  - Start by provisioning your resources using the Terraform scripts.  Refer to the [Terraform Documentation](./terraform/readme.md) for additional details.
  - Export the resulting Ansible inventory and configure your nodes using the Ansible scripts.  Refer to the [Ansible Documentation](./ansible/README.md) for additional details.