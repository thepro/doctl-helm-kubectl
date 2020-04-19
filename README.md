# Doctl, Helm and Kubectl in One Container

An Alpine Docker image with doctl, helm 3 and kubectl executables.
This container can be used in your local machine to connect to DigitalOcean k8 cluster
(OR)
**<ins> Can be used with CI/CD pipline </ins>**

- [Doctl, Helm and Kubectl in One Container](#doctl--helm-and-kubectl-in-one-container)
  - [Configuring for local use](#configuring-for-local-use)
  - [Configuring for local with alias](#configuring-for-local-with-alias)
  - [Configuring for CI/CD on K8](#configuring-for-ci-cd-on-k8)
  - [Github Repo](#github-repo)
  - [Show your support](#show-your-support)
  - [Acknowledgments](#acknowledgments)

## Configuring for local use

export TOKEN=REPLACE_YOUR_DO_ACCESS_TOKEN_HERE

1. Get avialable clusters

```
docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
doctl k cluster list
```

2. Get a k8 cluster you prefer

```
docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
doctl k cluster save K8_CLUSTER_NAME_FROM_LIST_ABOVE
```

3. Execute kubectl commands

```
docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
kuebctl get nodes
```

4. Execute Helm commands:

```
docker run -i
-e DIGITALOCEAN_ACCESS_TOKEN=$TOKEN \
-v ~/.kube:/root/.kube \
-v ~/.helm:/root/.helm \
thepro/doctl-helm-kubectl \
helm list
```

## Configuring for local with alias

Add following aliases to your bash to directly access doctl, helm and kubectl from commandline

1. Edit bashrc

```
nano ~/.bashrc
```

2. Add Aliases

```
export TOKEN=REPLACE_YOUR_DO_ACCESS_TOKEN_HERE

alias helm="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl helm"

alias kubectl="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl kubectl"

alias doctl="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl doctl"
```

3. Source Aliases

```
source ~/.bashrc
```

4. Connect to DO cluster

```
doctl k cluster list
doctl k cluster save K8_CLUSTER_NAME_FROM_LIST_ABOVE
kuebctl get nodes
helm list
```

## Configuring for CI/CD on K8

Simply include DIGITALOCEAN_ACCESS_TOKEN as environment variable

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: cd-pod
spec:
  containers:
  - name: helm
    image: thepro/doctl-helm-kubectl
    command:
    - cat
    tty: true
    env:
      - name: DIGITALOCEAN_ACCESS_TOKEN
        value: REPLACE_YOUR_DO_ACCESS_TOKEN_HERE
```

## Github Repo

https://github.com/thepro-io/doctl-helm-kubectl

## Show your support

Give a ⭐️ if this project helped you!

## Acknowledgments

- Uses [bash](https://hub.docker.com/_/bash) as base image
- Inspired by [alpine/helm](https://hub.docker.com/r/alpine/helm)
- Table of contents generated with [markdown-toc](http://ecotrust-canada.github.io/markdown-toc/)
