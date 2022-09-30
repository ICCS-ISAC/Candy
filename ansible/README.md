English version below
# Ansible

Déploiement de nœuds indy grâce au Playbooks Ansible

## Comment tester le playbook

```ansible-playbook --private-key ~/.ssh/<key>.pem -i indy_node/tests/inventory.yml --extra-vars "host=lab_nodes" indy_node/deploy.yml```

Le fichier d'inventaire attendu (généré à partir de la sortie Terraform) ressemble à ceci :

```
lab_nodes :
  hôtes :
    <host_address_from_terraform> :
      eth0_ip : <eth0_ip_address_from_terraform>
      eth1_ip : <eth1_ip_address_from_terraform>
```
### Vous pouvez utiliser Ansible dans un docker
```
$ docker run -it -v //c/Users/Wade.BARNES-DESIGNS/.ssh/:/root/.ssh -v //c/Candy/ansible/:/root/ansible ansible
```

## Fonctionnant sur AWS

- Mettez à jour `remote_user` de `devops` vers `ubuntu` dans tous les fichiers qui le définissent.
- Basculez `cloud` de `azure` à `aws` dans `indy_node/roles/indy_node/defaults/main.yml`.
__________

# Ansible Playbooks for Indy Node deployment

## QuickStart

The following steps assume:
- You have already followed [these](../README.md#using-the-terraform-and-ansible-scripts-in-this-repository) instructions and are hosting the code inside the development container.
- You are somewhat familiar with Ansible.
- You have already provisioned your Nodes using the Terraform scripts.

1. Export the ansible inventory from your Terraform project.
    - From your Terraform project run (for example):
      ```
      vscode ➜ /workspaces/Candy/terraform/aws $ terraform output -raw ansible_inventory > ../../ansible/aws-inventory.yml
      ```
    - This will output an inventory file that will look something like this.  The number of hosts listed in the file will depend on the number of nodes you have provisioned.
      ```
      nodes:
        hosts:
          20.104.111.61:
          20.104.254.144:
      ```
1. Import (copy) the SSH private key to use during your Ansible sessions.
    - Copy the key into the `./ansible` directory.
    - **Always make sure your key has a passphrase.**
    - **Permanently delete the key from the directory when you are done.**
    - **When committing code, always ensure you do not accidentally commit your key to the repo.**  There are entries in the `.gitignore` file to help prevent these situations, however depending the naming conventions you use for your key they might not work for your particular file.

1. Load your SSH private key into the terminal session.
    - From the `./ansible` directory run the following commands:
      ```
      ssh-agent bash
      ssh-add ./<private-ssh-key-filename-here>
      ```
    - Enter your passphrase when prompted.
1. Run the playbook.  Ensure you include the correct ssh username for your environment(s) with the `--user` parameter; `validatornode` for azure environments and `ubuntu` for aws environments.
    - For example:
      ```
      ansible-playbook --user ubuntu -i aws-inventory.yml --extra-vars "cloud=aws network_name=candy-test indy_node_channel=rc indy_node_pkg=indy-node indy_node_pkg_version=1.13.2~rc3 indy_plenum_pkg_version=1.13.1~rc2" indy_node/deploy.yml
      ```
    - To have better control over the groups of tasks that get run:
      ```
      ansible-playbook --user ubuntu -i aws-inventory.yml --extra-vars "cloud=aws network_name=candy-test indy_node_channel=rc indy_node_pkg=indy-node indy_node_pkg_version=1.13.2~rc3 indy_plenum_pkg_version=1.13.1~rc2 network_configuration=true install_packages=true mount_data_volume=true indy_node_configuration=false" indy_node/deploy.yml
      ```
    - When establishing the initial ssh connection to the servers you can disable all task groups:
      ```
      ansible-playbook --user ubuntu -i aws-inventory.yml --extra-vars "cloud=aws network_name=candy-test indy_node_channel=rc indy_node_pkg=indy-node indy_node_pkg_version=1.13.2~rc3 indy_plenum_pkg_version=1.13.1~rc2 network_configuration=false install_packages=false mount_data_volume=false indy_node_configuration=false" indy_node/deploy.yml
      ```
1. Generate Genesis files using tools in [von-network](https://github.com/bcgov/von-network)
, for example:

    `./manage generategenesisfiles "./tmp/CANdy Dev Genesis File Node info - Trustees.csv" "./tmp/CANdy Dev Genesis File Node info - Stewards.csv"`

1. Once you've initialized your node(s) and have generated the `domain_transactions_genesis` and `pool_transactions_genesis` files, you can copy them along side the ansible inventory files and run the configuration again.  The files will be copied to the servers and the indy-node servce will be enabled and started.

## Playbook behaviour

The playbook will setup and configure `indy-node` on a newly provisioned Ubuntu 16.04 or 20.04 VM hosted in either AWS or Azure.

You **MUST** specify the correct ssh username for your environment via `--user` when running the playbook.

The cloud provider is defined by setting the `cloud` variable in `--extra-vars` when running the playbook.  From there the playbook will auto-detect the OS version and configure the networking accordingly.

Following network configuration the packages are installed and configured.  The playbook is capable of configuring the node(s) as a genesis node, or as a new node connecting to an existing network.  Node initialization occurs only once, subsequent runs of the script will detect the existing configuration and skip over any steps that have already been completed to ensure the node's configuration is not inadvertently modified.

> Node Initialization:
> 
> Node initialization depends on a few things:
>  - **Network name** - You **MUST** supply a network name via the `network_name` variable.  The name should be consistent across all nodes within the same network.  The network name defines the name of the directory on the node where all of the files, keys, and data will be stored.
>  - **Node Alias** - The node alias is a human readable name for the node.  The configuration tasks read the hostname from the node and use the value as the node alias.
>  - **Network configuration** - Specifically the IP addresses of the client and node NICs.  The IP addresses are gathered automatically by the network configuration tasks.


> Genesis Node:
>  - A node that will be used during the formation of a new network.
>  - If you do not supply values for the `*_transactions_genesis_url` variables, the script will configure the node as a genesis node.
>  - The node will be left in a state where it is ready to have an initial set of genesis files added before the `indy-node` service is started for the first time; it will be initialized, no genesis files will exist, and the `indy-node` service will be stopped and disabled.

> New Node - connecting to an existing network:
>  - A node that will be added to an existing network.
>  - If you supply values for the `*_transactions_genesis_url` variables, the script will configure the node to connect to the existing network defined by the genesis files.
>  - The node will be left in a running state; the genesis files will be downloaded, and the `indy-node` service will be enabled and started.

There are several playbook variables that can be used to control the behaviour of the scripts.  Refer to the [Playbook options](./README.md#playbook-options) section below for details.

## Playbook options

The following variables can be used to control various settings and behaviours of the playbook.  The variables listed as **_required_** have defaults, however it is best to review these key variables and set them explicitly based on your environment.

`cloud` - **_required_** (default=`azure`)
  - Defines the cloud provider hosting the node(s).
  - Supported values are `asure` and `aws`.

`network_name` - **_required_** (default=`candy-dev`)
  - Defines the name of the network to configure for the node(s).

`indy_node_channel` - **_required_** (default=`rc`)
  - Defines the name of the package channel to use when installing packages.
  - Supported values depend on the indy node package repositories.

`indy_node_pkg` - **_required_** (default=`indy-node`)
  - Defines the name of the indy-node package to install.
  - Options include `indy-node` (for generic `indy-node` installations), `sovrin` (for `sovrin` installations).

`indy_node_pkg_version` - **_required_** (default=`1.13.2~rc3`)
  - Defines the version of `indy-node` to be installed.
  - **_Note_**:
    - `indy-node` and `sovrin` versions <=1.12.x only support Ubuntu 16.04.
    - `indy-node` and `sovrin` versions >=1.13.x only support Ubuntu 20.04.

`indy_plenum_pkg_version` - **_optional_** (default=`indy_node_pkg_version`)
  - Defines the version of `indy-plenum` to be installed.
  - You only need to define this when the version of `indy-plenum` to be installed is different than the version of `indy-node`.

`domain_transactions_genesis_url` - **_optional_** (default=`null`)
  - Defines the URL endpoint for downloading the domain_transactions_genesis needed to connect the node(s) to an existing network.

`pool_transactions_genesis_url` - **_optional_** (default=`null`)
  - Defines the URL endpoint for downloading the pool_transactions_genesis_url needed to connect the node(s) to an existing network.

`node_seed` - **_optional_** (default=`null`)
  - The seed to be used for the node initialization.  If not defined the node will be initialized with a random seed.  This is useful if you are moving a node to another hosting environment and want to ensure the same keys are generated for the new instance.

`node_port` - **_optional_** (default=`9701`)
  - Defines the port on which the node(s) will communicate with other nodes.

`client_port` - **_optional_** (default=`9702`)
  - Defines the port on which the node(s) will communicate with clients.
 
`network_configuration` - **_optional_** (default=`true`)
  - Boolean value indicating whether or not the network configuration tasks should be run.

`install_packages` - **_optional_** (default=`true`)
  - Boolean value indicating whether or not the package installation tasks should be run.

`mount_data_volume` - **_optional_** (default=`true`)
  - Boolean value indicating whether or not to configure and mount the node's data volume.

`indy_node_configuration` - **_optional_** (default=`true`)
  - Boolean value indicating whether or not the node configuration tasks should be run.
  - The node configuration tasks depend on the network configuration tasks.  If the node configuration tasks are selected the network configuration tasks will also be run.

`start_indy_node` - **_optional_** (default=`true`)
  - Boolean value indicating whether or not to enable and start the indy-node service.

## ToDo:
- Automate the collection of the information needed to fill out the Steward Genesis spreadsheet.