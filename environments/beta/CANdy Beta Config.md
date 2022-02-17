## Notice - The CANdy Beta network has been Decommissioned
- The configuration files are being retained for historical purposes.

### Steps to complete after `indy-node` installation

1. Set Network Name in config.py
`sudo sed -i -re "s/(NETWORK_NAME = ')\w+/\1candy-beta/" /etc/indy/indy_config.py`
- Done

2. Create Network Directory

`sudo -i -u indy mkdir /var/lib/indy/candy-beta`
- Done

3. Initialize **i-0f054b1159b284a78**

`sudo -i -u indy init_indy_node beta-bc-1 172.31.200.192 9701 172.31.200.192 9702`
- Done see CANdy Beta in 1Password

4. Initialize **i-0f1de969c6a3f6371**

`sudo -i -u indy init_indy_node beta-bc-2 172.31.202.43 9701 172.31.202.43 9702`
- Done see CANdy Beta in 1Password

5. Initialize **i-0d12f57143828fcd8**

`sudo -i -u indy init_indy_node beta-bc-3 172.31.204.23 9701 172.31.204.23 9702`
- Done see CANdy Beta in 1Password

6. Initialize **i-0dd743d3c8eeb0d0b**

`sudo -i -u indy init_indy_node beta-bc-4 172.31.206.25 9701 172.31.206.25 9702`
- Done see CANdy Beta in 1Password

7. Generate Trustee DIDs:
- Done see CANdy Beta in 1Password, and spreadsheets in this folder.

8. Generate Steward DIDs:
- Done see CANdy Beta in 1Password, and spreadsheets in this folder.

9. Genesis files:
- Generate - Done
- Run on each node after installing the genesis files:
  - `sudo chown indy:indy *`
- beta-bc-1 - Installed
- beta-bc-2 - Installed
- beta-bc-3 - Installed
- beta-bc-4 - Installed

10. Start the network

Misc. Admin commands:
```
sudo systemctl start indy-node
sudo systemctl stop indy-node

sudo systemctl status indy-node.service
sudo systemctl enable indy-node.service
sudo systemctl disable indy-node.service

sudo validator-info
```