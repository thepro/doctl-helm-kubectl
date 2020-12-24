FROM docker:20.10.1-dind

RUN apk add --no-cache curl git bash

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && ./get_helm.sh 
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v1.54.0/doctl-1.54.0-linux-amd64.tar.gz  | tar xz
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl


RUN mv doctl /usr/bin/doctl
RUN mv kubectl /usr/bin/kubectl

RUN chmod +x /usr/bin/kubectl

RUN rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

ENV PATH "$PATH:/usr/bin/doctl:/usr/bin/kubectl:/usr/local/bin/helm:/usr/bin/git"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["ash"]
