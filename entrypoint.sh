#!/bin/sh -l
set -e

if [[ -z "${DIGITALOCEAN_ACCESS_TOKEN}" ]]; then
    echo "DIGITALOCEAN_ACCESS_TOKEN missing!"
    exit 127
fi
if [[ -z "${DIGITALOCEAN_K8S_CLUSTER_NAME}" ]]; then
     echo "DIGITALOCEAN_K8S_CLUSTER_NAME missing!"
    exit 127
fi


doctl k cluster kubeconfig save ${DIGITALOCEAN_K8S_CLUSTER_NAME}

