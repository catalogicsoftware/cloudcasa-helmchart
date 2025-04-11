# CloudCasa Kubernetes Agent

[CloudCasa](https://cloudcasa.io) - Leader in Kubernetes Data Protection and Application Resiliency

# Introduction

CloudCasa is a SaaS data protection, disaster recovery, migration, and replication solution for Kubernetes and cloud-native applications. Configuration is quick and easy, and basic service is free.

CloudCasa provides two types of backup services for Kubernetes: 
* **CloudCasa Pro** provides centralized backup, DR, and migration services for large, complex, multi-cluster, multi-cloud, and hybrid cloud environments. It includes multi-cloud account integration, managed backup storage, and advanced cross-cloud recovery.
* **CloudCasa Velero Management** provides centralized management and monitoring, guided recovery, and commercial support for existing Velero backup installations.

Whether you are managing existing Velero installations or using the advanced Pro features, with CloudCasa you don't need to be a storage or data protection expert to back up and restore your Kubernetes clusters.

This Helm chart installs and configures the CloudCasa agent on a Kubernetes cluster.
See the CloudCasa [Getting Started Guide](https://cloudcasa.io/get-started) for more information.

## Prerequisites

1. Kubernetes 1.20+
2. Helm 3.0+

## Installation
 
### Installing the CloudCasa Agent

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under Clusters/Overview. Note the returned cluster ID.
2. Add the CloudCasa Helm repo to your Helm configuration, if it hasn't been added already.
   ```
   $ helm repo add cloudcasa-repo https://catalogicsoftware.github.io/cloudcasa-helmchart
   ```
3. To install the agent, execute the following helm commands, replacing ```<Cluster ID>``` with the Cluster ID obtained above:
    ```
    $ helm repo update
    $ helm install cloudcasa cloudcasa-repo/cloudcasa --set clusterID=<Cluster ID>
    ```
This will install the CloudCasa agent and complete registration of the cluster with the CloudCasa service.

### Updating the CloudCasa Agent
1. Log in to https://home.cloudcasa.io and obtain the cluster ID for your cluster by selecting it under Clusters/Overview. You can also obtain the current setting for it with the command ```helm get values cloudcasa```.
2. Execute the following commands to update the agent, replacing ```<Cluster ID>``` with the Cluster ID obtained above:
    ```
    $ helm repo update
    $ helm upgrade cloudcasa cloudcasa-repo/cloudcasa --set clusterID=<Cluster ID>
    ```

### Uninstalling the CloudCasa Agent
1. Execute the following commands to uninstall CloudCasa.
    ```    
    $ helm uninstall cloudcasa
    ```

2. If you manually created the cloudcasa-io namespace in order to supply a container registry authentication secret (see below),
you may need to manually delete the namespace after uninstall with the command `kubectl delete namespace cloudcasa-io`.

3. CloudCasa creates some custom resource definitions on installation, which you can remove manually with the command `kubectl delete crd -l component=kubeagent-backup-helper`.

### Using an alternate image repository

The agent manager container can be installed from an alternate repository by setting values for image.repository and image.tag.
Add the options --set image.repository=<repository> and/or --set image.tag=<tag> to the helm install command.

Note that the alternate repository will also need to be set for the cluster in CloudCasa so that all agent containers will be loaded from it.
See the [CloudCasa User Guide](https://docs.cloudcasa.io/help/cluster-add.html) for more information.

If the registry you are using requires authentication, you can define a Kubernetes secret with the authentication information
and reference it by setting a value for imagePullSecret. Example: "--set imagePullSecret=registrySecret".
See the [Kubernetes Docs](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) for more information.
Note that the secret must be created in the cloudcasa-io namespace, so you may need to create the namespace first.
Also note that when uninstalling the agent, you may need to delete the cloudcasa-io namespace manually after running helm uninstall with "kubectl delete namespace cloudcasa-io".

Finally, the secret name will also need to be set in CloudCasa for the cluster, so that it will be used for all agent containers.
See the [CloudCasa User Guide](https://docs.cloudcasa.io/help/cluster-add.html) for more information.

*CloudCasa is a trademark of Catalogic Software, Inc.*
