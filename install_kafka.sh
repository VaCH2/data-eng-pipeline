#!/bin/bash

cd "confluent\helm"
helm upgrade --install kafka ./confluent-operator --values $VALUES_FILE --namespace default --set kafka.enabled=true
