FROM docker:19.03.13-dind

RUN apk add --no-cache curl git

RUN curl -L https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz |tar xvz 
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v1.46.0/doctl-1.46.0-linux-amd64.tar.gz  | tar xz
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl


RUN mv linux-amd64/helm /usr/bin/helm
RUN mv doctl /usr/bin/doctl
RUN mv kubectl /usr/bin/kubectl

RUN chmod +x /usr/bin/helm
RUN chmod +x /usr/bin/kubectl

RUN rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

ENV PATH "$PATH:/usr/bin/doctl:/usr/bin/kubectl:/usr/bin/helm:/usr/bin/git"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["ash"]