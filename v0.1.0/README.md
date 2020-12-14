# Cloudcasa
Cloudcasa is one of the most versatile SaaS solution to manage backups for your Kubernetes/Docker containers and Volumes.

## Introduction

This chart bootstraps a kube-agent deployment on a client Kuberntes [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. This chart registers a client Kubernetes cluster to the Cloudcasa server.

## Helm Chart installation modes

## CLI based installation
##### Update the value of AMDS_CLUSTER_ID in the values.yaml file.

```
1. helm repo add cloudcasa-repo https://nitishdsharma.github.io/cloudcasa-kubeagent
2. helm install <Chart Object Name> cloudcasa-repo/cloudcasa-kubeagent --set AMDS_CLUSTER_ID=<CLUSTER ID VALUE>
```
