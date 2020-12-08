# Cloudcasa
Cloudcasa is one of the most versatile SaaS solution to manage backups for your Kubernetes/Docker containers and Volumes.

## Introduction

This chart bootstraps a kubeagent deployment on a client Kuberntes [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. This inturn registers the client Kubernetes cluster with Cloudcasa

## Prerequisites

- Kubernetes 1.16+
- Helm 2.11+ or Helm 3.0+

## Helm Chart installation modes

- CLI based installation
##### Update the value of AMDS_CLUSTER_ID in the values.yaml file.

```bash
1. helm repo add cloudcasa-repo https://catalogicsoftware.github.io/cloudcasa-kubeagent
2. helm search repo cloudcasa-kubeagent
3. Create a values.yaml with entry AMDS_CLUTSER_ID: <Cluster ID>
4. helm install <release name> cloudcasa-repo/cloudcasa-kubeagent -f values.yaml
```
- Helmchart hosted on Rancher Apps

```
1. Register the cloudcasa helm chart repo in the Rancher Apps Repository.
2. Go to charts select the repo -> Cloudcasa-app chart.
3. Provide the name of release. 
4. In cloudcasa setting section, provide the AMDS_CLUSTER_ID.
5. Click on Install button.
```

## Uninstalling the Chart on CLI

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete <release name>
```
