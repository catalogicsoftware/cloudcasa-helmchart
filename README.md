# CloudCasa Kubernetes Agent

## Introduction

[CloudCasa](https://cloudcasa.io) is a class-leading SaaS solution providing data protection services for Kubernetes and cloud native applications.

This chart installs and configures the CloudCasa agent on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- Helm 2.11+ or Helm 3.0+

## Installation

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Setup tab. Note the cluster ID.
2. Execute the following helm commands:
```
  helm repo add cloudcasa-repo https://catalogicsoftware.github.io/cloudcasa-helmchart
  helm install cloudcasa.io cloudcasa-repo/cloudcasa-helmchart --set cluster_id=<Cluster ID>
```

## Uninstall

To uninstall/delete the `cloudcasa.io` deployment:

```
  helm delete cloudcasa.io
```

## Upgrade steps
```
helm upgrade cloudcasa.io cloudcasa-repo/cloudcasa-helmchart --set cluster_id=<CLUSTER ID>
```
