FROM alpine:latest
MAINTAINER David Stefan <stefda@gmail.com>

RUN apk update && apk add rsync

EXPOSE 873
VOLUME /volume
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
