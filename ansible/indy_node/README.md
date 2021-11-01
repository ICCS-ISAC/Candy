# Ansible

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

## Running on AWS

Update `remote_user` from `devops` to `ubuntu` in all files the define it.
Switch `cloud` from `azure` to `aws` in `main.yml`.
