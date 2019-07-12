FROM alpine:3.8

RUN apk add --no-cache \
      bash \
      httpie \
      jq \
      python3 \
    && pip3 --no-cache-dir install --upgrade pip

ARG AWSCLI_VERSION=0.0.0

RUN pip3 --no-cache-dir install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["aws"]
