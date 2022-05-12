FROM alpine:3.15.4

USER root

RUN apk add \
    bash \
    git \
    openssh \
    git-subtree

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
