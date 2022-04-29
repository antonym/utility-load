FROM alpine:3.15

RUN \
 apk update && \
 apk add ansible git bash open-lldp

RUN \
git clone https://github.com/antonym/utility-load.git /opt/utility

ENTRYPOINT ["/opt/utility/load.sh"]
