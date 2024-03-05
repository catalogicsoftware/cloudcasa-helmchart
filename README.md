# CloudCasa Kubernetes Agent

[CloudCasa](https://cloudcasa.io) - Leader in Kubernetes Data Protection and Application Resiliency

# Introduction

CloudCasa is a SaaS data protection, disaster recovery, and migration solution for Kubernetes and cloud-native applications. Configuration is quick and easy, and the basic service is free.

CloudCasa provides two types of backup services for Kubernetes: 
* **CloudCasa Pro** provides centralized backup services for large, complex, multi-cluster, multi-cloud, and hybrid cloud environments. It includes multi-cloud account integration, managed backup storage, and advanced cross-cloud recovery.
* **CloudCasa Velero Management** provides centralized management and monitoring, guided recovery, and commercial support for existing Velero backup installations.

Whether you are managing existing Velero installations or using the advanced Pro features, with CloudCasa you don't need to be a storage or data protection expert to back up and restore your Kubernetes clusters.

This Helm chart installs and configures the CloudCasa agent on a Kubernetes cluster.
See the CloudCasa [Getting Started Guide](https://cloudcasa.io/get-started) for more information.

## Prerequisites

1. Kubernetes 1.20+
2. Helm 3.0+

## Installation

### Helm CLI Installation

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Protection tab. Note the returned cluster ID.
2. Execute the following helm commands, replacing ```<ClusterID>``` with the Cluster ID obtained above:
    ```
    $ helm repo add cloudcasa-repo https://catalogicsoftware.github.io/cloudcasa-helmchart
    $ helm install cloudcasa.io cloudcasa-repo/cloudcasa --set cluster_id=<Cluster ID>
    ```
This will install the CloudCasa agent and complete registration of the cluster with the CloudCasa service.

## Updating the CloudCasa Agent
1. Log in to https://home.cloudcasa.io and obtain the cluster ID for your cluster by selecting it under the Protection tab.
2. Execute the following commands to update the agent:
    ```
    $ helm repo update
    $ helm upgrade cloudcasa.io cloudcasa-repo/cloudcasa --set cluster_id=<Cluster ID>
    ```

## Uninstalling the CloudCasa Agent
1. Execute the following commands to uninstall CloudCasa.
    ```    
    $ helm uninstall cloudcasa.io
    $ kubectl delete namespace/cloudcasa-io clusterrolebinding/cloudcasa-io
    ```
*CloudCasa is a trademark of Catalogic Software Inc.*
