FROM debian:jessie
MAINTAINER DAVID Stefan <stefda@gmail.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 873
VOLUME /docker
ADD ./rsync /usr/local/bin/rsync

ENTRYPOINT ["/usr/local/bin/rsync"]
