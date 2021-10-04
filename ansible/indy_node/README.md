# Ansible

Ansible Playbooks for indy node deployment

## How to test the playbook

```ansible-playbook --private-key ~/.ssh/<key>.pem -i indy_node/tests/inventory --extra-vars "host=lab_nodes" indy_node/tests/test.yml```
