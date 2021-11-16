#!/bin/bash

echo "Setting up local cluster and registry"
ctlptl apply -f registry.yaml
ctlptl apply -f cluster.yaml

# https://github.com/rancher/local-path-provisioner the default one done by kind does not work
echo "Setting up local volume provisioning"
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

# https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx setting up local ingress
echo "Setting up ingress controller"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

echo "Your installation is completed. Ingress will boot up after few minutes."