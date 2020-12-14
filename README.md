# CloudCasa Kubernetes Agent

## Introduction

[CloudCasa](https://cloudcasa.io) is a class-leading SaaS solution providing data protection services for Kubernetes and cloud native applications.

This chart installs and configures the CloudCasa agent on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.13 or higher

## Installation

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Setup tab. Note the cluster ID.
2. Execute the following helm commands, replacing "CLUSTER ID" with your cluster ID:
```
  helm repo add cloudcasa-repo https://catalogicsoftware.github.io/cloudcasa-helmchart
  helm install cloudcasa.io cloudcasa-repo/cloudcasa-helmchart --set AMDS_CLUSTER_ID=<CLUSTER ID>
```
3. See the CloudCasa [Getting Started Guide](https://cloudcasa.io/get-started) for more info.

## Upgrade

1. Log in to https://home.cloudcasa.io and obtain your cluster ID by clicking on the appropriate cluster name in the Setup tab.
2. Use the ```helm list --filter 'cloudcasa'``` command to verify that a cloudcasa-helmchart release is installed.
3. ```helm upgrade cloudcasa.io cloudcasa-repo/cloudcasa-helmchart --set AMDS_CLUSTER_ID=<CLUSTER ID>```

*CloudCasa is a trademark of Catalogic Software Inc.*

