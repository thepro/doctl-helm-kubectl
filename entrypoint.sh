#!/usr/bin/env bash
set -Eeuo pipefail
: ${DIGITALOCEAN_ACCESS_TOKEN:?"Container won't start without DIGITALOCEAN_ACCESS_TOKEN"}
: ${DIGITALOCEAN_K8_CLUSTER:?"Container won't start without DIGITALOCEAN_K8_CLUSTER"}

doctl k cluster kubeconfig save ${DIGITALOCEAN_K8_CLUSTER}
# first arg is `-f` or `--some-option`
# or there are no args
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
        # docker run bash -c 'echo hi'
        exec bash "$@"
fi

exec "$@"