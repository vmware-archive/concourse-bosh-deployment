# Deploy Concourse with BOSH on GCP

## Description

This repository is derived from https://github.com/concourse/concourse-bosh-deployment

Its main purpose is to offer a simple way to deploy Concourse v5.5.x (cluster only) for Platform Automation (i.e. with a Credhub and Uaa), on top of a pre-configured Ops Manager and BOSH Director on GCP.

## Assumptions

1. GCP has been paved and you have a file named `terraform-outputs.yml` which, among other items, contains your target concourse url in a variable named `concourse_url`

1. The `bosh` and `om` cli's are installed and configured to target the ops manager and bosh director respectively.

1. The `credhub` cli is installed and configured to target the bosh credhub.

## Steps

1. Create a user in the BOSH Credhub for Concourse basic auth

    ```bash
    credhub generate -n /p-bosh/concourse/local_user -t user -z admin
    ```

1. Interpolate the file `vars.yml.template`

    ```bash
    om interpolate --config vars.yml.template --vars-file ../terraform-outputs.yml > vars.yml
    ```

1. Upload latest 621 family stemcell for Xenial

    ```bash
    bosh upload-stemcell --sha1 8a91be2437e1c37991e601c0869e4d95a023f704 \
      https://bosh.io/d/stemcells/bosh-google-kvm-ubuntu-xenial-go_agent?v=621.61
    ```

1. Execute the script `deploy.sh` to kick off the bosh deployment
