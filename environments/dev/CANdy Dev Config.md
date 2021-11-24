Steps to complete after `indy-node` installation

1. Set Network Name in config.py

`sudo sed -i -re "s/(NETWORK_NAME = ')\w+/\1candy-dev/" /etc/indy/indy_config.py`

2. Create Network Directory

`sudo -i -u indy mkdir /var/lib/indy/candy-dev`

3. Initialize The Node using Internal IPs

Example:
`sudo -i -u indy init_indy_node <ALIAS> <node ip> <node port> <client ip> <client port>`
`sudo -i -u indy init_indy_node dev-bc-1 172.31.100.224 9701 172.31.101.201 9702`

4. Add Node information to Steward Spreadsheet

5. Generate Trustee DID(s) using tools in `von-network` and add to Trustee Spreadsheet

6. Generate Steward DID(s) using tools in `von-network` and add to Steward Spreadsheet

7. Generate Genesis files using tools in `von-network`

8. Copy Genesis files to `/var/lib/indy/candy-dev`

9. Run `sudo chown indy:indy *` in `/var/lib/indy/candy-dev`

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