# docker-awscli

## overview

aws cli packaged in docker

using the [alpine linux docker image](https://hub.docker.com/_/alpine/)

this is an extremely lightweight image containing:

- python3
- pip3
- awscli

total image size is approx 100mb

## usage

### specifying version

to run a specific tagged version of the awscli, specify the version in the docker tag, e.g.

`snapkitchen/awscli:${VERSION}`

to run the newest awscli version that has been built and tagged, use the `latest` docker tag, e.g.:

`snapkitchen/awscli:latest`

### specifying credentials

to pass credentials, either:

- provide them as [environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html) with the `docker run` command, e.g.:

  ```
  docker run --rm \
      -e "AWS_ACCESS_KEY_ID=MYACCESSKEY" \
      -e "AWS_SECRET_ACCESS_KEY=MYSECRETKEY" \
      -e "AWS_DEFAULT_REGION=us-east-1" \
      snapkitchen/awscli:latest \
      s3 ls s3://example-bucket
  ```

OR

- mount your `.aws` folder to the `/root/.aws` folder inside the container, e.g.:

  ```
  docker run --rm \
      -v "${HOME}/.aws:/root/.aws" \
      snapkitchen/awscli:latest \
      s3 ls s3://example-bucket
  ```

### entrypoint

entrypoint is `aws`, so arguments can be specified directly, e.g.:

`docker run --rm snapkitchen/awscli:latest --version`

### one-off commands

example `aws s3 ls` using `docker run`

`docker run --rm snapkitchen/awscli:latest s3 ls s3://example-bucket`

## development

builds are automatically handled by [docker hub](https://hub.docker.com/)

to build and release an image for awscli, first determine the version change:

- if releasing a newer version than the current version on master, update master

- otherwise, create a new branch named after the version of the awscli to be built

1. modify the `Dockerfile` and update the `AWSCLI_VERSION` variable value to the specified version
2. tag the commit as the awscli version, matching the value used in the `Dockerfile`