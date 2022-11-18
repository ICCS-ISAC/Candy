# CANdy-Prod AML and TAA

Below are links to the AML and TAA for the CANdy network.  For infomration on how to register or update the AML and TAA for the network refer to the [Registration section](#registration).

## AML

The AML is defined here; [(Layer-1)-CANdy-Acceptance-Mechanism-List-(AML)](https://github.com/bcgov/bc-vcpedia/wiki/(Layer-1)-CANdy-Acceptance-Mechanism-List-(AML))

## TAA

The TAA is defined here; [(Layer-1)-CANdy-Transaction-Author-Agreement](https://github.com/bcgov/bc-vcpedia/wiki/(Layer-1)-CANdy-Transaction-Author-Agreement)

## Registration

To register or update the AML and TAA with the network use the [von-network](https://github.com/bcgov/von-network) `./manage apply-taa` command, for example:

```
./manage apply-taa \
    walletName=local_net_trustee_wallet \
    poolName=local_net \
    useDid=V4SGRU86Z58d6TV7PBUe6f \
    amlUrl='https://raw.githubusercontent.com/wiki/bcgov/bc-vcpedia/(Layer-1)-CANdy-Acceptance-Mechanism-List-(AML).md' \
    amlVersion=0.1 \
    taaUrl='https://raw.githubusercontent.com/wiki/bcgov/bc-vcpedia/(Layer-1)-CANdy-Transaction-Author-Agreement.md' \
    taaVersion=0.1 \
    taaRatificationTime="2022-08-09T11:05:00-0700"
```