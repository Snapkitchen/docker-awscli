FROM alpine:3.8

ENV AWSCLI_VERSION=1.16.10

RUN apk add --no-cache python3 \
    && pip3 --no-cache-dir install --upgrade pip \
    && pip3 --no-cache-dir install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["aws"]
