# Build Consul Server Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

ARG CONSUL_VERSION

ENV DNS_RESOLVES "consul"
ENV DNS_PORT "8600"
ENV CONSUL_ADDR "http://consul:8500"

# Install Software
# hadolint ignore=DL3003,DL3018,DL3019
RUN wget -O /tmp/glibc-2.23-r3.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk && \
  wget -O /tmp/consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
  apk add --allow-untrusted /tmp/glibc-2.23-r3.apk && \
  apk del openssl bash && \
  cd /usr/bin && \
  unzip /tmp/consul.zip && \
  chmod +x /usr/bin/consul && \
  rm -rf /tmp/consul.zip /tmp/glibc-2.23-r3.apk /var/cache/apk/*

# Configure Config And Set Permissions
COPY config/*.json /config/

RUN  mkdir /data && \
  addgroup -S consul && \
  adduser -S -H -G consul consul && \
  chown consul:consul -R /config /data 

USER consul
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

# Configure Consul Start With A Default Server Mode
ENTRYPOINT ["/usr/bin/consul"]
CMD ["agent", "-server", "-config-dir=/config", "-bootstrap"]
