FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt update && apt upgrade -y && \
    apt install imagemagick texlive-extra-utils ghostscript -y --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY policy.xml /etc/ImageMagick-6/policy.xml

RUN groupadd -g 1000 pdf && \
    useradd -s /bin/bash -r -u 1000 -g pdf pdf && \
    cp /bin/bash /bin/sh

USER pdf

WORKDIR /data
ENTRYPOINT ["/bin/bash"]