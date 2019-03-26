#!/usr/bin/env bash


#set the config straight below, if running from cmd-line
#gcloud container clusters get-credentials trillo-rt-k8s --zone us-central1-a --project project-trillort

kubectl apply -f namespace.yaml
kubectl apply -f secrets-dh.yaml
kubectl apply -f secrets-mysql.yaml
kubectl apply -f pvpvc-stage1.yaml
kubectl apply -f deploy-nfs.yaml
kubectl apply -f pvpvc-stage2.yaml
kubectl apply -f deploy-mysql.yaml
kubectl apply -f deploy-ds.yaml
kubectl apply -f deploy-redis.yaml
kubectl apply -f deploy-rt.yaml
kubectl apply -f rt-service-account.yaml


