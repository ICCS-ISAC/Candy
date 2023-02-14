<!-- ENTETE -->
English version below

[![img](https://img.shields.io/badge/Cycle%20de%20Vie-Phase%20B%C3%AAta-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/License-Apache2-blue)](LICENSE)

---

<div>
    <a target="_blank" href="https://www.quebec.ca/gouvernement/ministere/cybersecurite-numerique">
      <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" alt="Logo du Ministère de la cybersécurité et du numérique" />
    </a>
</div>
<!-- FIN ENTETE -->

# Candy

## Candy : Initiative pancanadienne sur une chaîne de blocs Hyperledger Indy

Que peut-on trouver dans ce dépôt :
- Documents sur la façon d'installer un nœud indy - [Steward Validator](doc/NodeInstallation)
- Code pour provisionner le nœud indy IaaS avec [terraform](terraform/)
- Code pour installer et configurer le nœud indy avec [ansible](ansible/indy_node)
- Informations nécessaires pour connecter les différents utilisateurs pancanadiens

## Candy : Initiative pan-canadienne Hyperledger Indy 

Ce que l'on peut trouver dans ce repo :

- Code pour provisionner le nœud indy IaaS avec [terraform](terraform/).
- Code pour installer et configurer le nœud indy via [ansible](ansible/)
- Documents supplémentaires sur la façon d'installer un nœud indy - [Steward Validator](doc/node-installation/)
- Informations nécessaires pour connecter les différents utilisateurs pan-canadiens
  
## Utilisation des scripts Terraform et Ansible

La méthode privilégiée pour travailler avec les scripts Terraform et Ansible contenus dans ce dépôt est de lancer le code situé dans le projet Visual Studio "devContainer". Terraform et Ansible sont installés et prêts à l'emploi dans ce conteneur. Il n'estdonc pas nécessaire d'installer l'un ou l'autre sur votre machine locale.

### Ce dont vous avez besoin

- Git
- Visual Studio Code avec l'extension [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installée.
- Ce projet cloné sur votre machine locale.
- Vous devez également avoir un compte Terraform Cloud configuré pour gérer vos informations d'identification et les variables nécessaires pour vos environnements donnés. Ce projet contient un projet [terraform/meta](terraform/meta/)  pour vous aider à peupler vos espaces de travail Terraform Cloud.
  
### Comment commencer

- Clonez le projet.
- Ouvrez le projet dans Visual Studio Code. Vous serez invité à rouvrir le projet dans un conteneur.
- Sélectionnez Reopen in Container lorsque vous y êtes invité.
- Ouvrez une fenêtre de terminal intégrée et naviguez vers le répertoire Terraform ou Ansible souhaité pour commencer à utiliser les scripts.
- Commencez par approvisionner vos ressources à l'aide des scripts Terraform. Reportez-vous à la [Documentation Terraform](./terraform/readme.md) pour plus de détails.
- Exportez l'inventaire Ansible résultant et configurez vos nœuds à l'aide des scripts Ansible. Pour plus d'informations, consultez la [Documentation Ansible](./ansible/README.md).
  
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
