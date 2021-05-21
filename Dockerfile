# syntax=docker/dockerfile:1.2

ARG VERSION=latest

FROM launchdarkly/ld-relay:$VERSION 

USER 0
RUN --mount=type=secret,id=relay_key curl -vv https://sdk.launchdarkly.com/relay/latest-all -H "Authorization: $(cat /run/secrets/relay_key)" -o /data.tar.gz 

ENV FILE_DATA_SOURCE /data.tar.gz
USER 1000

