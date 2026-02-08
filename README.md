# kustomize-etcd

A kustomization to deploy etcd for development purposes.

It deploys one etcd with three replicas and PVCs with no node affinity.

The manifests are taken from the etcd operations guide: https://etcd.io/docs/v3.7/op-guide/kubernetes/

## Use

Apply with kustomize.

If your cluster domain is not `cluster.local` patch the env
`CLUSTER_DOMAIN` in the statefulset. See the `kustomization.yaml`, copy
the `CLUSTER_DOMAIN` patch there and put it in your kustomization with
the correct domain.

## Updating

1. Store current dry output
2. Put the upstream version as-is in the original folder.
3. Diff new dry output with old dry output
4. Adjust patches as needed.
