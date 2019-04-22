FROM alpine:3.8

ARG AWSCLI_VERSION=0.0.0

RUN apk add --no-cache python3 \
    && pip3 --no-cache-dir install --upgrade pip \
    && pip3 --no-cache-dir install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["aws"]
