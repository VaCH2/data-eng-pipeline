# data-eng-pipeline

## Setup Kubernetes cluster
* Follow [this](https://cloud.google.com/kubernetes-engine/docs/quickstart) quickstart to create a project and setup the local Cloud SDK. 
* Make sure you install the Beta components as well
* Follow the steps to connect to project and set default region  
* Enable [authentication](https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication) 
* For Windows, execute [create_cluster.bat](create_cluster.bat) to create the cluster. Other systems: copy-paste the gcloud command. 
* For Windows, execute [setup_GCP_client.bat](setup_GCP_client.bat) to authenticate a GCP service account, required for Kafka. As only one cluster is used in this setup, we follow the steps described [here](https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication#service_within_the_same_cluster)

## Install requirements
* Install [Helm](https://helm.sh/docs/intro/install/)
* set environment variable with [set.bat])(set.bat), as explained [here](https://docs.confluent.io/current/installation/operator/co-configure.html#co-create-provider-yaml)


