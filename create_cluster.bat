@echo off

set /p projectname= What is the name of the created Google project?

gcloud beta container --project %projectname% clusters create "data-eng-k8s" --zone "europe-north1-a" --no-enable-basic-auth --cluster-version "1.16.13-gke.401" --machine-type "e2-standard-2" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/data-engineering-101-291811/global/networks/default" --subnetwork "projects/data-engineering-101-291811/regions/europe-north1/subnetworks/default" --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoscaling --min-nodes "0" --max-nodes "20" --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 

pause
cmd /k
