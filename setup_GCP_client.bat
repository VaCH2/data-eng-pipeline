@echo off

kubectl create serviceaccount servicedataeng -n kube-system
kubectl create clusterrolebinding servicedataeng --clusterrole=cluster-admin --serviceaccount kube-system:servicedataeng

pause
cmd /k
