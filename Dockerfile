FROM alpine:3.15.4

USER root

COPY ssh_config /root/.ssh/config

RUN apk add git \
    openssh \
    git-subtree

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
