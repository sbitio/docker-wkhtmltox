FROM debian:buster
LABEL maintainer="soporte@sbit.io"

ENV RELEASE="0.12.6-1"

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -yqq -o=Dpkg::Use-Pty=0 --no-install-recommends \
      ca-certificates \
      wget \
      gsfonts \
 && wget -nv -O /tmp/wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/${RELEASE}/wkhtmltox_${RELEASE}.buster_amd64.deb \
 && apt-get -qy install /tmp/wkhtmltox.deb \
 && rm -rf /tmp/wkhtmltox.deb \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean -yqq

ENTRYPOINT [ "wkhtmltopdf" ]
CMD [ "-h" ]
