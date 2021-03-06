# docker-awscli

## overview

aws cli packaged in docker

using the [alpine linux docker image](https://hub.docker.com/_/alpine/)

this is an extremely lightweight image containing:

- awscli
- bash
- httpie
- jq
- pip3
- python3

total image size is approx 116mb

## usage

### specifying version

to run a specific tagged version of the awscli, specify the version in the docker tag, e.g.

`snapkitchen/awscli:${VERSION}`

### specifying credentials

to pass credentials, either:

- provide them as [environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html) with the `docker run` command, e.g.:

  ```
  docker run --rm \
      -e "AWS_ACCESS_KEY_ID=MYACCESSKEY" \
      -e "AWS_SECRET_ACCESS_KEY=MYSECRETKEY" \
      -e "AWS_DEFAULT_REGION=us-east-1" \
      snapkitchen/awscli:${VERSION} \
      s3 ls s3://example-bucket
  ```

OR

- mount your `.aws` folder to the `/root/.aws` folder inside the container, e.g.:

  ```
  docker run --rm \
      -v "${HOME}/.aws:/root/.aws" \
      snapkitchen/awscli:${VERSION} \
      s3 ls s3://example-bucket
  ```

### entrypoint

entrypoint is `aws`, so arguments can be specified directly, e.g.:

`docker run --rm snapkitchen/awscli:${VERSION} --version`

### one-off commands

example `aws s3 ls` using `docker run`

`docker run --rm snapkitchen/awscli:${VERSION} s3 ls s3://example-bucket`

## development

builds are automatically handled by [docker hub](https://hub.docker.com/r/snapkitchen/awscli)

to build and release an image for awscli, add the relevant version to the list in `awscli-versions`
