# CloudCasa Kubernetes Agent

## Introduction

[CloudCasa](https://cloudcasa.io) is a class-leading SaaS solution providing data protection services for Kubernetes and cloud native applications.

This chart bootstraps a CloudCasa kube-agent deployment on a client [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Helm chart installation methods

### Installation using Rancher Apps Repository

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Setup tab.
2. Register the cloudcasa helm chart repo in the Rancher Apps Repository
3. Go to charts and select the repo -> Cloudcasa-kubeagent chart.
4. Provide the release name.
5. In the cloudcasa settings section, enter the AMDS_CLUSTER_ID provided by CloudCasa in step 1.
6. Click on the Install button

### CLI-based installation

1. Log in to https://home.cloudcasa.io and add your Kubernetes cluster under the Setup tab.
2. Update the value of AMDS_CLUSTER_ID in the values.yaml file with the value provided by CloudCasa.
3. Execute the following helm commands:
```
  helm repo add cloudcasa https://catalogicsoftware.github.io/cloudcasa-helm
  helm search repo cloudcasa
  helm install <release name> cloudcasa/cloudcasa-kubeagent -f values.yaml
```

*CloudCasa is a trademark of Catalogic Software Inc.*
