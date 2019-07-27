![](images/trillo-complete-logo-100x34.png)

# Kubernetes Templates for Trillo-Runtime

A Set of templates which deploys a fully-functional Trillo RunTime
environment on any K8S cluster. They have been verified on
[Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/).

## Video Instructions
[![](http://img.youtube.com/vi/cYQpzM-FbVo/0.jpg)](http://www.youtube.com/watch?v=cYQpzM-FbVo "")

## Deployment

![](https://drive.google.com/uc?id=1FqSKZQqq8pjuYQwdgPGBJe6qvUvXify4)

### Deployment Requirements for GKE

GCP account is required for GKE.

1. Create a new project in the [Google Developer Console](https://console.developers.google.com/project) and note the new project's ID.

1. In the [APIs & Services of the Google Developers Console](https://console.developers.google.com/apis/) of your new project, enable the following APIs:

    * Google Compute Engine Instance Group Manager API
    * Google Compute Engine Instance Group Updater API
    * Google Compute Engine Instance Groups API
    * Google Kubernetes Engine API

1. Install the Cloud SDK version `185.0.0` or greater using [these instructions](https://cloud.google.com/sdk/).

1. Authenticate to gcloud:

    ```shell
    $ gcloud auth login
    ```

1. Set your project and zone:

    ```shell
    $ gcloud config set project YOUR_PROJECT_ID
    $ gcloud config set compute/zone <your-cluster-zone>
    ```

1. Enable `kubernetes` features:

    ```shell
    $ gcloud components update kubectl
    ```

### Pre Deployment Steps

- Download All files of this repo from github.

- Request access from info@trillo.io to download private dockerhub images.

- Customize secrets for Redis
  - using the command "openssl rand -base64 32", replace REDIS_SECRET in both files:
    - secrets-redis.yaml
    - deploy-redis.yaml

- Customize secrets for mysql server
  - using the command "openssl rand -base64 32",replace MYSQL_PASSWORD in mysql-secrets.yaml

- Furnish secrets of your dockerhub account using https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/.
  - replace DOCKER_CREDENTIALS in secrets-dh.yaml


### Create Deployment

- (Use Console or Command-line) Create a 3-nodes k8s cluster with 3vCPUs and approx. 8GB (equivalent to the default GKE cluster.
- Connect to the newly create cluster via command-line.
  - Example:
    ```shell
    gcloud container clusters get-credentials standard-cluster-1 --zone us-central1-a --project project-trillort
    ```

- Run deploy-trillo.sh to deploy the application.
- The deployment will spin up containers for NFS servers, a MYSQL
  instance and trillo runtime containers.
- A public ip address will be assigned to the trillo-rt service where all apps
  are deployed and launched.

## OpenSource Licenses

- https://github.com/opentrillo/install-centos