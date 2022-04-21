FROM alpine:3.15

RUN \
 apk update && \
 apk add ansible git bash

COPY . /opt/utility/
ENTRYPOINT ["/opt/utility/load.sh"]
