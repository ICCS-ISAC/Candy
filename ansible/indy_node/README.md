English version below
# Ansible

Déploiement de nœuds indy grâce au Playbooks Ansible

## Comment tester le playbook

```ansible-playbook --private-key ~/.ssh/<key>.pem -i indy_node/tests/inventory.yml --extra-vars "host=lab_nodes" indy_node/pool_automation/deploy.yml```

Le fichier d'inventaire attendu (généré à partir de la sortie Terraform) ressemble à ceci :

```
lab_nodes :
  hôtes :
    <host_address_from_terraform> :
      eth0_ip : <eth0_ip_address_from_terraform>
      eth1_ip : <eth1_ip_address_from_terraform>
```
### Vous pouvez utiliser Ansible dans un docker
```
$ docker run -it -v //c/Users/Wade.BARNES-DESIGNS/.ssh/:/root/.ssh -v //c/Candy/ansible/:/root/ansible ansible
```

## Fonctionnant sur AWS

- Mettez à jour `remote_user` de `devops` vers `ubuntu` dans tous les fichiers qui le définissent.
- Basculez `cloud` de `azure` à `aws` dans `indy_node/pool_automation/roles/indy_node/defaults/main.yml`.
__________
Ansible Playbooks for indy node deployment

## How to test the playbook

```ansible-playbook --private-key ~/.ssh/<key>.pem -i indy_node/tests/inventory.yml --extra-vars "host=lab_nodes" indy_node/pool_automation/deploy.yml```

The expected inventory file (generated from Terraform output) looks something like this:

```
lab_nodes:
  hosts:
    <host_address_from_terraform>:
      eth0_ip: <eth0_ip_address_from_terraform>
      eth1_ip: <eth1_ip_address_from_terraform>
```
### You can use Ansible in a docker
```
$ docker run -it -v //c/Users/Wade.BARNES-DESIGNS/.ssh/:/root/.ssh -v //c/Candy/ansible/:/root/ansible ansible
```

## Running on AWS

Update `remote_user` from `devops` to `ubuntu` in all files the define it.
Switch `cloud` from `azure` to `aws` in `indy_node/pool_automation/roles/indy_node/defaults/main.yml`.
