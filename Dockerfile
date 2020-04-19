FROM bash:latest

RUN apk add --no-cache curl

RUN curl -L https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz |tar xvz 
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v1.41.0/doctl-1.41.0-linux-amd64.tar.gz  | tar xz
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl


RUN mv linux-amd64/helm /usr/bin/helm
RUN mv doctl /usr/bin/doctl
RUN mv kubectl /usr/bin/kubectl

RUN chmod +x /usr/bin/helm
RUN chmod +x /usr/bin/kubectl

RUN rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*

ENV PATH "$PATH:/usr/bin/doctl:/usr/bin/kubectl:/usr/bin/helm"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]