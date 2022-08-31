# Upgrade Commands

To generate the schedule run the indy-node-monitor Generate Network Upgrade Schedule command.
For example;
```
./run.sh --net cdn --seed <seed> --upgrade-schedule --upgrade-start "2022-08-15T05:00:00-0700"
```

Example of generating the `sha256` for the command:
```
curl https://repo.sovrin.org/deb/pool/xenial/stable/s/sovrin/sovrin_1.1.92_amd64.deb --output sovrin_1.1.92_amd64.deb
shasum -a 256 sovrin_1.1.92_amd64.deb
```
- The `sha256` does not need to be changed, it can be reused for future commands.

## 2022-08-15 Upgrade

### Schedule

```
ledger pool-upgrade name=CANdyDevUpgrade20220815 package=sovrin version=1.1.92 action=start timeout=15 sha256=add7177e4212c4c27047f39b7cdf4c6cd8edb4181852fe45996ebc60bb0d6ae9 schedule={"DcvgAW7Wuw2aDxakjJGxFnssaXoAgUEWBhRUfNoEeVHx":"2022-08-15T05:00:00-0700","6Ey8JA9YDPzEccbi4dGTaEoPtWK6bvVki6WveWHMUjHb":"2022-08-15T05:05:00-0700","FgRxLSbzVzcMC8ioAbzbzYi1oqhYLUsoFeDewYiw97U":"2022-08-15T05:10:00-0700","CfTG6ZPJzXRu9xozL43jzsA8EQXRvkbDHvYw3QzuTQrf":"2022-08-15T05:15:00-0700"}
```

### Cancel

```
ledger pool-upgrade name=CANdyDevUpgrade20220815 package=sovrin version=1.1.92 reinstall=true action=cancel sha256=add7177e4212c4c27047f39b7cdf4c6cd8edb4181852fe45996ebc60bb0d6ae9
```