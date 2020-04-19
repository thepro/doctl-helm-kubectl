# Doctl with Helm and Kubectl

An Alpine Docker image with doctl, helm and kubectl executables.
This container can be used in your local machine to connect to DigitalOcean k8 cluster
(OR)
Can be used with yout CI/CD pipline

### Configuring and using

export TOKEN=YOUR_DO_ACCESS_TOKEN

1. Get avialable clusters

docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
doctl k cluster list

2. Get a k8 cluster you prefer

docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
doctl k cluster save K8_CLUSTER_NAME_FROM_LIST_ABOVE

3. execute kubectl commands

docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
kuebctl get nodes

4. execute helm commands

docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
helm list

### Github Repo

https://github.com/thepro-io/doctl-helm-kubectl

## Show your support

Give a ⭐️ if this project helped you!

## Acknowledgments

- Uses [bash](https://hub.docker.com/_/bash) as base image
- Inspired by [alpine/helm](https://hub.docker.com/r/alpine/helm)
