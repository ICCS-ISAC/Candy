# Installer un nœud sur une blockchain Indy - Steward Validator

Pour vous aider à démarrer rapidement, voici les documents avec lesquels vous souhaitez commencer :

Ce qui suit est un ensemble de documents de la Fondation Sovrin pour l'intégration des stewards au réseau Sovrin. Excellent matériel de référence pour la mise en place d'un réseau :

- [Guide de préparation du validateur délégué v3](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F18MNB7nEKerlcyZKof5AvGMy0GP9T82c4SWaxZkPzya4%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913727359%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=YiSo3s7mEuEZS9BDP6cgLDAYKa%2FK9Q%2BOZk3HpP62UPM%3D&reserved=0)
- [Installation de la machine virtuelle AWS Indy Node](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1pbtMVvtbBZxneFD1GPXYPVI41aa-klLxXjaNFSp8uR8%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913737356%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=j%2FbwMbMlxj9rx%2B1Ojtdm33cGIij5%2FPGDYuytEWIGTco%3D&reserved=0)
- [Installation de la machine virtuelle Azure Indy Node](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1EF5HF6HkTSQThwFODniWvx1RpKAKuuDdJiRfbmN8AAo%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913747350%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=Dam2TQifwc%2FfsPFovBo%2F0H4OX3QySmKwbwF1oZRkCTc%3D&reserved=0)
- [Installation de la VM GCP Indy Node](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1X-87yznL9vhU_xbkS3eb1agGc4VrT0LYVmqDNklrFeQ%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913747350%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=jcc5jv5pzHIKDT3LgaiYV%2BX0LCFsoOwpzrpR7PaG%2FL8%3D&reserved=0)
- [Installer Indy Node sur du matériel physique](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1UfjHdHdpF6lNU2tPXuit0xEgYaFMMyD67fPfOvoL7_A%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913757344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=VVieG1Ceqg2mDPaL48%2BLKYB2H1yGfzTdQBmReSglYvA%3D&reserved=0)

Et il y a ce document de référence pour ce qui est impliqué dans la mise en place d'un nouveau réseau basé sur des nœuds indy qui fait référence à une partie de la documentation ci-dessus :

- [Créer un nouveau réseau Indy](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1XE2QOiGWuRzWdlxiI9LrG9Am9dCfPXBXnv52wGHorNE%2Fedit&data=04%7C01%7CShakira.Kaleel%40ontario.ca%7C6d86686071834578918c08d97e902909%7Ccddc1229ac2a4b97b78a0e5cacb5865c%7C0%7C0%7C637679979913757344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=7tOO2rrt%2B4N6vKZnbflDuHqwlcs8G1yEcGl36g9ILWE%3D&reserved=0)

Les documents de ce référentiel uniquement à des fins d'archivage. Utilisez les liens pour être sûr d'accéder à une documentation à jour.

## Dimensionnement de la machine du réseau de développement

- 2 vCPUs cores
- 8G de RAM
- Disque 250G
- 2 NIC avec 2 adresses IP publiques sur des sous-réseaux séparés (1 par NIC)
- Jusqu'à 5 Gigabit pour les performances du réseau

Par exemple sur AWS, ce serait une machine t3.large.

## Dimensionnement de la machine du réseau intermédiaire

- 8 vCPUs cores
- 32G de RAM
- Disque 250G
- 2 NIC avec 2 adresses IP publiques sur des sous-réseaux séparés (1 par NIC)

Par exemple sur AWS, ce serait un t3.2xlarge
