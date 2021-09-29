# Installing a node on a Indy blockchain - Steward Validator

To provide a quick start, here are the documents you want to start with:

The following is a set of documents from the Sovrin Foundation for onboarding stewards onto the Sovrin Network. Great reference material for setting up a network:

- [Steward Validator Preparation Guide v3](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F18MNB7nEKerlcyZKof5AvGMy0GP9T82c4SWaxZkPzya4%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913727359%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=YiSo3s7mEuEZS9BDP6cgLDAYKa%2FK9Q%2BOZk3HpP62UPM%3D&reserved=0)
- [AWS Indy Node VM Install](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1pbtMVvtbBZxneFD1GPXYPVI41aa-klLxXjaNFSp8uR8%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913737356%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=j%2FbwMbMlxj9rx%2B1Ojtdm33cGIij5%2FPGDYuytEWIGTco%3D&reserved=0)
- [Azure Indy Node VM Install](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1EF5HF6HkTSQThwFODniWvx1RpKAKuuDdJiRfbmN8AAo%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913747350%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=Dam2TQifwc%2FfsPFovBo%2F0H4OX3QySmKwbwF1oZRkCTc%3D&reserved=0)
- [GCP Indy Node VM Install](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1X-87yznL9vhU_xbkS3eb1agGc4VrT0LYVmqDNklrFeQ%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913747350%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=jcc5jv5pzHIKDT3LgaiYV%2BX0LCFsoOwpzrpR7PaG%2FL8%3D&reserved=0)
- [Install Indy Node on physical hardware](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1UfjHdHdpF6lNU2tPXuit0xEgYaFMMyD67fPfOvoL7_A%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913757344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=VVieG1Ceqg2mDPaL48%2BLKYB2H1yGfzTdQBmReSglYvA%3D&reserved=0)

And there is this reference document for what’s involved with setting up a new indy-node based network which references some of the above documentation:

- [Create New Indy Network](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1XE2QOiGWuRzWdlxiI9LrG9Am9dCfPXBXnv52wGHorNE%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913757344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=7tOO2rrt%2B4N6vKZnbflDuHqwlcs8G1yEcGl36g9ILWE%3D&reserved=0)

The documents in this repo only for archive purpose. Use the links to be sure to access up to date documentation.

## Dev Network machine sizing

- 2 vCPUs cores
- 8G RAM
- 250G disk
- 2 NICs with 2 Public IP addresses on separate subnets (1 per NIC)

## Staging Network machine sizing

- 8 vCPUs cores
- 32G RAM
- 250G disk
- 2 NICs with 2 Public IP addresses on separate subnets (1 per NIC)
