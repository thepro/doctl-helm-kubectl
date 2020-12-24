FROM alpine:3.12.3

RUN apk add --no-cache curl bash openssl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && ./get_helm.sh && \ 
    curl -L https://github.com/digitalocean/doctl/releases/download/v1.54.0/doctl-1.54.0-linux-amd64.tar.gz  | tar xz  &&\
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    mv doctl /usr/bin/doctl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

ENV PATH "$PATH:/usr/bin/doctl:/usr/bin/kubectl:/usr/local/bin/helm"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

