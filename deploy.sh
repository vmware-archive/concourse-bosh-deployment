#!/bin/bash

eval "$(direnv export bash)"

bosh -d concourse deploy cluster/concourse.yml \
  -o cluster/operations/privileged-http.yml \
  -o cluster/operations/privileged-https.yml \
  -o cluster/operations/enable-lets-encrypt.yml \
  -o cluster/operations/basic-auth.yml \
  -o cluster/operations/scale.yml \
  -o cluster/operations/tls-vars.yml \
  -o cluster/operations/uaa.yml \
  -o cluster/operations/credhub-colocated.yml \
  -o cluster/operations/offline-releases.yml \
  -o cluster/operations/backup-atc-colocated-web.yml \
  -o cluster/operations/secure-internal-postgres.yml \
  -o cluster/operations/secure-internal-postgres-bbr.yml \
  -o cluster/operations/secure-internal-postgres-uaa.yml \
  -o cluster/operations/secure-internal-postgres-credhub.yml \
  -o cluster/operations/larger-worker-disk.yml \
  -o cluster/operations/web-target-pool.yml \
  -o cluster/operations/ephemeral-ips.yml \
  -l vars.yml \
  -l versions.yml

