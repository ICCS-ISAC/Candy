# Performing an Upgrade of the CANdy Network

The following documentation outlines the process of deploying a software upgrade on the CANdy network.

## Determining when to upgrade

Network upgrades are performed when new releases of the network's, [Hyperledger Indy Node](https://github.com/hyperledger/indy-node) based, software are published.  Like all other software, releases are published as new features are introduced, bugs or vulnerabilities are fixed, or dependencies are updated.  It is up to the Board of Trustees and any Technical Governance Comity to review the changes contained in any given release and determine whether those changes warrant an upgrade to the CANdy network(s).

Generally the Network Operations team will keep an eye on the releases and bring them to the attention of the Board of Trustees and any Technical Governance Comity, and make recommendations on whether or not to upgrade.

## Scheduling an upgrade

The various governing bodies in coordination with the Steward Council determines the upgrade schedule including; setting the priority of the upgrade, when the initial network upgrade will be performed, and when upgrades of subsequent networks will be performed (i.e. the time interval between each network [`dev`, `test`, `prod`] being upgraded).

Factors to be considered when scheduling an upgrade:
- Avoiding or postponing any node maintenance scheduled by the Stewards.

- The urgency of the update.
  - Does the new release contain a fix for a critical vulnerability, important bugs fixes, new features, or just updates?

    This can impact not only the how quickly the initial upgrade needs to occur, but it can also impact how quickly subsequent networks need to be upgraded.

- Impact of the upgrade.
  - Does the new release contain any breaking changes that may require additional contingency plans to be formulated.  Will the update impact the availability of the network for any period of time, or is the upgrade expected to be a typical rolling upgrade with no impact on the network's availability?

    Some upgrades, such as those that contain breaking changes or that require migration scripts require the network upgrade to occur on all nodes of the network simultaneously to avoid any ledger corruption or consensus issues.  During such upgrades the ledger will be completely unavailable for the period of time the upgrade is occurring.  This is in direct contrast to a typical rolling upgrade where the availability of the network is not impacted.  During a rolling upgrade the network will continue to support all read/write operations since the nodes are scheduled to perform their upgrades far enough apart in time that only a single node's availability is affected at any given time.

- Pre or post requisites

    Are there any activities that need to be performed on the nodes before an upgrade can commence or after an upgrade is complete?  For example: Do new repository keys need to be registered before the upgrade can be successfully executed on the nodes?

    Such activities can impact the upgrade schedule as they require Steward involvement and resources to be carried out.

- The number of Trustee signatures required to write the `pool-upgrade` transaction to the ledger.

## Performing the upgrade

[Hyperledger Indy Node](https://github.com/hyperledger/indy-node) has a builtin upgrade feature.  A named `pool-upgrade` transaction is written to the `config` ledger of the network.  This transaction is then synchronized with all the nodes on the network and the defined upgrade schedule is registered with each node.  From this point on the nodes manage their own upgrades and report the success or failure to the `config` ledger.  In the case an upgrade fails on a node, it will be retried every 15 minutes until it either succeeds or is canceled.

In the case an upgrade needs to be canceled a matching cancel transaction can be written to the network.  This will cancel any pending node upgrades, or stop a node from retrying a failing upgrade.

The transaction is generated and later written to the ledger using the indy-cli(-rs).

## Generating the `pool-upgrade` transactions

When generating the `pool-upgrade` transaction you should always generate a matching cancel transaction in case it's needed.  Both transactions require Trustee signatures to be written to the ledger.  Generating the cancel transaction at the same time avoids any delays associated with the signing process in the case the upgrade needs to be canceled.  You will not write the cancel transaction to the ledger unless you need to cancel the upgrade for some reason, such as it needs to be canceled and rescheduled before it starts, or the upgrade is failing on some nodes.  If the upgrade completes successfully the cancel transaction will go unused, i.e. it will not be written to the ledger.

You will need to generate a different set of `pool-upgrade` and cancel commands for each ledger and get each set signed by the appropriate trustees.

The command to generate the `pool-upgrade` command takes the following form:

```
ledger pool-upgrade name=<UniqueUpgradeName> package=<PackageToUpgrade> version=<UpgradeToPackageVersion> action=start timeout=15 sha256=<PackageSha> schedule=<UpgradeSchedule> sign=false send=false
```

The command to generate the matching cancel command takes the following form:

```
ledger pool-upgrade name=<SameUniqueUpgradeName> package=<SamePackageToUpgrade> version=<SameUpgradeToPackageVersion> reinstall=true action=cancel sha256=<SamePackageSha> sign=false send=false
```

### Creating the schedule for an upgrade command

The easiest and most reliable way to generate an upgrade schedule is to use the [indy-node-monitor](https://github.com/hyperledger/indy-node-monitor) with the [Generate Network Upgrade Schedule](https://github.com/hyperledger/indy-node-monitor/blob/main/fetch-validator-status/plugins/generate_upgrade_schedule/README.md) plugin.

This command-line tool ensures the schedule includes all of the active nodes on the network by dynamically querying the pool for the most recent information, and ensures the upgrade interval between the nodes is consistent by calculating the offsets for each node from a start time you provide, and also ensures the final schedule is formatted correctly (always use the `--raw` flag).

For information and example on how to use this command-line tool refer to the [Generate Network Upgrade Schedule](https://github.com/hyperledger/indy-node-monitor/blob/main/fetch-validator-status/plugins/generate_upgrade_schedule/README.md) documentation.


### Creating an `sha256` for the upgrade command

The upgrade command requires you to provide an sha256 for the upgrade package.  To generate this value you can run the following commands:

```
curl <repoUrl>/<debPackageName> --output <debPackageName>
shasum -a 256 <debPackageName>
```

For example:
```
curl https://repo.sovrin.org/deb/pool/xenial/stable/s/sovrin/sovrin_1.1.92_amd64.deb --output sovrin_1.1.92_amd64.deb
shasum -a 256 sovrin_1.1.92_amd64.deb
```
- The once generated the `sha256` does not need to be changed, it can be reused for future commands.

### Examples of completed upgrade commands

#### Schedule

```
ledger pool-upgrade name=CANdyDevUpgrade20220815 package=sovrin version=1.1.92 action=start timeout=15 sha256=add7177e4212c4c27047f39b7cdf4c6cd8edb4181852fe45996ebc60bb0d6ae9 schedule={"DcvgAW7Wuw2aDxakjJGxFnssaXoAgUEWBhRUfNoEeVHx":"2022-08-15T05:00:00-0700","6Ey8JA9YDPzEccbi4dGTaEoPtWK6bvVki6WveWHMUjHb":"2022-08-15T05:05:00-0700","FgRxLSbzVzcMC8ioAbzbzYi1oqhYLUsoFeDewYiw97U":"2022-08-15T05:10:00-0700","CfTG6ZPJzXRu9xozL43jzsA8EQXRvkbDHvYw3QzuTQrf":"2022-08-15T05:15:00-0700"} sign=false send=false
```

#### Cancel

```
ledger pool-upgrade name=CANdyDevUpgrade20220815 package=sovrin version=1.1.92 reinstall=true action=cancel sha256=add7177e4212c4c27047f39b7cdf4c6cd8edb4181852fe45996ebc60bb0d6ae9 sign=false send=false
```

### Generate the transactions

Use the indy-cli(-rs) to execute the commands.  The output is the unsigned version of the transaction that will later be written to the ledger.

The resulting transaction will look something like this:
```
{"reqId":1676071207102756319,"identifier":"Bhhsxc585EVgbbmosZr65J","operation":{"type":"109","name":"CANdyDevUpgrade20220815","version":"1.1.92","action":"start","sha256":"add7177e4212c4c27047f39b7cdf4c6cd8edb4181852fe45996ebc60bb0d6ae9","timeout":15,"schedule":{"6Ey8JA9YDPzEccbi4dGTaEoPtWK6bvVki6WveWHMUjHb":"2022-08-15T05:05:00-0700","CfTG6ZPJzXRu9xozL43jzsA8EQXRvkbDHvYw3QzuTQrf":"2022-08-15T05:15:00-0700","DcvgAW7Wuw2aDxakjJGxFnssaXoAgUEWBhRUfNoEeVHx":"2022-08-15T05:00:00-0700","FgRxLSbzVzcMC8ioAbzbzYi1oqhYLUsoFeDewYiw97U":"2022-08-15T05:10:00-0700"},"reinstall":false,"force":false,"package":"sovrin"},"protocolVersion":2}
```

_Note:_ The DID listed in the `identifier` field will be your DID.  Unless you are a Trustee, it is best practice to replace your DID with the DID of one of the Trustees that will be signing the transaction.  You can find the Trustee DIDs in the spreadsheets mentioned below.

### Collect Trustee signatures

Copy and paste the transaction into the appropriate `Ledger Transactions to Execute` spreadsheet contained in the [Trustee Tools](https://drive.google.com/drive/folders/1BmS881phtNeptE5HJX5kq-U2D2wGZFCp) folder:
- [CANdy-Test - Ledger Transactions to Execute](https://docs.google.com/spreadsheets/d/1wreNJeCyYpb_Xattw4BrXGjv2f8YF5J-_uBvVdUudKg/edit#gid=0)
- [CANdy-Prod - Ledger Transactions to Execute](https://docs.google.com/spreadsheets/d/1FMDBMxyLGfggWvSSnU5kHRTAgbnDq4ozb6fAB0eO_Gk/edit#gid=0)

Inform the appropriate Trustees there are transactions that need to be signed and wait for the transaction to have enough signatures to be written to the ledger.  The Trustees should already be familiar with the process of signing a transaction.

### Write the `pool-upgrade` transaction to the ledger

Using the indy-cli(-rs) connected to the target network, write the signed transaction to the leger using the following command:
```
ledger custom <SignedTransaction> sign=false
```

## Monitoring the upgrade

Monitor the upgrade using [indy-node-monitor](https://github.com/hyperledger/indy-node-monitor).  Run `./manage start indy-node-monitor` to launch the indy-node-monitor API.

Under `/networks/{network}`, select the target network, select `status=true` and enter the seed for you NETWORK_MONITOR DID.  Then click execute.  You should see all of the nodes listed and each node's output should include information about the scheduled upgrade.  Use the API to monitor the progress of the upgrade on each node.  As the nodes upgrade you will see them go offline for a short period of time and when they come back up you should see the upgraded package information displayed for the node.  During the upgrade you will also see warnings about package mismatches.  This is normal and the warnings will disappear once all the nodes are upgraded.

If you find the upgrade is taking too long (more than 15 minutes) on one or more nodes, you may need to cancel the upgrade and contact the Steward of the affected nodes in order to review the logs and troubleshoot possible upgrade issues before rescheduling the upgrade for a later time or date.

## Documenting network upgrades

Each network upgrade should be documented, including the date of the upgrade and the indy-cli(-rs) commands needed to schedule and cancel the upgrade.  An example of such documentation can be found the `2022-08-15 Upgrade` section of the [Dev Upgrade](../environments/dev/Upgrade.md#2022-08-15-upgrade) document.
