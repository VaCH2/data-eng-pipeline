#!/bin/bash

cd "confluent\helm"
helm upgrade --install operator ./confluent-operator --values $VALUES_FILE --namespace default --set operator.enabled=true
