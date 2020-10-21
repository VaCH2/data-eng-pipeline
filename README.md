# data-eng-pipeline

## Setup Kubernetes cluster
* Follow [this](https://cloud.google.com/kubernetes-engine/docs/quickstart) quickstart to create a project and setup the local Cloud SDK. 
* Make sure you install the Beta components as well
* Follow the steps to connect to project and set default region  
* Enable [authentication](https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication) 
* Execute [create_cluster.sh](create_cluster.sh) to create the cluster.
* --not necessary-- Execute [setup_GCP.sh](setup_GCP.sh) to authenticate a GCP service account, required for Kafka. As only one cluster is used in this setup, we follow the steps described [here](https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication#service_within_the_same_cluster)

## Kafka installation
* Install [Helm](https://helm.sh/docs/intro/install/)
* Set an environment variable with [set.bat])(set.bat) (for Windows), as explained [here](https://docs.confluent.io/current/installation/operator/co-configure.html#co-create-provider-yaml)
* Install the Confluent operator by executing [install_operator.sh](install_operator.sh)
* Install Zookeeper by executing [install_zookeeper.sh]([install_zookeeper.sh)
* Install the Kafka broker by executing [install_kafka.sh](install_kafka.sh)

## Kafka validation (optional)
To ensure Kafka is installed properly, you can create a test topic and publish and consume some messages.

1. Open two terminals, and run the following command in each terminal
```
kubectl -n default exec -it kafka-0 bash
``` 

2. In one terminal run the following commands (change the username and password if necessary) 
``` 
cat <<EOF > kafka.properties
bootstrap.servers=kafka:9071
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username=test password=test123;
sasl.mechanism=PLAIN
security.protocol=SASL_PLAINTEXT
EOF 
```

```
kafka-topics --create --zookeeper zookeeper.default.svc.cluster.local:2181/kafka-default --replication-factor 3 --partitions 1 --topic testtopic
```

```
seq 10000 | kafka-console-producer --topic testtopic --broker-list kafka.default.svc.cluster.local:9071  --producer.config kafka.properties
```

3. In one terminal execute the following command. You will see the published messages on the testtopic

```
kafka-console-consumer --from-beginning --topic testtopic --bootstrap-server  kafka.default.svc.cluster.local:9071 --consumer.config kafka.properties

```








