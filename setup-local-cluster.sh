#!/bin/bash

echo "Setting up local cluster and registry"
ctlptl apply -f registry.yaml
ctlptl apply -f cluster.yaml

echo "Setting up local TLS"
kubectl create secret tls tls-development --cert=cert.pem --key=key.pem

# https://kind.sigs.k8s.io/docs/user/ingress/#ingress-nginx
echo "Setting up ingress controller"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

echo "Your installation is completed. Ingress will boot up after few minutes."