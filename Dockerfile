FROM debian:stretch
LABEL maintainer="soporte@sbit.io"

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -yqq -o=Dpkg::Use-Pty=0 --no-install-recommends \
      ca-certificates \
      wget \
 && wget -nv -O /tmp/wkhtmltox.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
 && apt-get -qy install /tmp/wkhtmltox.deb \
 && rm -rf /tmp/wkhtmltox.deb \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean -yqq

ENTRYPOINT [ "wkhtmltopdf" ]
CMD [ "-h" ]
