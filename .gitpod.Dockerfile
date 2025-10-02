FROM gitpod/workspace-full

USER root

RUN apt-get update && \
    wget https://github.com/gohugoio/hugo/releases/download/v0.129.0/hugo_extended_0.129.0_linux-amd64.deb && \
    dpkg -i hugo_extended_0.129.0_linux-amd64.deb && \
    rm hugo_extended_0.129.0_linux-amd64.deb
