#!/bin/bash

eval "$(direnv export bash)"

bosh -d concourse deploy concourse.yml \
  -o operations/privileged-http.yml \
  -o operations/privileged-https.yml \
  -o operations/enable-lets-encrypt.yml \
  -o operations/basic-auth.yml \
  -o operations/scale.yml \
  -o operations/tls-vars.yml \
  -o operations/uaa.yml \
  -o operations/credhub-colocated.yml \
  -o operations/backup-atc-colocated-web.yml \
  -o operations/secure-internal-postgres.yml \
  -o operations/secure-internal-postgres-bbr.yml \
  -o operations/secure-internal-postgres-uaa.yml \
  -o operations/secure-internal-postgres-credhub.yml \
  -o operations/larger-worker-disk.yml \
  -o operations/web-target-pool.yml \
  -o operations/ephemeral-ips.yml \
  -l vars.yml \
  -l versions.yml

