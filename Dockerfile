FROM alpine

MAINTAINER Seungkyu Ahn <seungkyua@gmail.com>

ENV HELM_VERSION="v2.8.1"

RUN apk add --update curl && \
  curl -O http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
  tar -zxvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz linux-amd64/helm && \
  mv linux-amd64/helm /usr/local/bin/helm && \
  apk del curl && \
  rm -rf /var/cache/apk/* && \
  rm -rf /helm-${HELM_VERSION}-linux-amd64.tar.gz && \
  rm -rf /linux-amd64

ENTRYPOINT ["helm"]
CMD ["help"]
