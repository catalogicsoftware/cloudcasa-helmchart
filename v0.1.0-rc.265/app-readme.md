# CloudCasa Kubernetes Agent

## Introduction

[CloudCasa](https://cloudcasa.io) is a class-leading SaaS solution providing data protection services for Kubernetes and cloud native applications.

This chart installs and configures the CloudCasa agent on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- Helm 2.11+ or Helm 3.0+

## Installation using Rancher Apps Repository

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Setup tab. Note the cluster ID.
2. Register the cloudcasa helm chart repo in the Rancher Apps Repository
3. Go to charts and select the repo -> Cloudcasa-kubeagent chart.
4. Provide the release name.
5. In the cloudcasa settings section, enter the AMDS_CLUSTER_ID provided by CloudCasa in step 1.
6. Click on the Install button

## Changelog
v0.1.0-rc.265

*CloudCasa is a trademark of Catalogic Software Inc.*
