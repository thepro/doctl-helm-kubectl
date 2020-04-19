# Doctl with Helm and Kubectl

An Alpine Docker image with doctl, helm and kubectl executables.
This container can be used in your local machine to connect to DigitalOcean k8 cluster
(OR)
Can be used with yout CI/CD pipline

- [Doctl with Helm and Kubectl](#doctl-with-helm-and-kubectl)
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

export TOKEN=REPLACE_YOUR_DO_ACCESS_TOKEN_HERE

alias helm="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl helm"

alias kubectl="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl kubectl"

alias doctl="docker run -ti --rm -e DIGITALOCEAN_ACCESS_TOKEN=\$TOKEN -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm thepro/doctl-helm-kubectl doctl"

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
- <small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>
