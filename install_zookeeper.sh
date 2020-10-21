#!/bin/bash

cd "confluent\helm"
helm upgrade --install zookeeper ./confluent-operator --values $VALUES_FILE --namespace default --set zookeeper.enabled=true
