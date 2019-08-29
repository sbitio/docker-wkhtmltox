FROM sbitio/wkhtmltox:latest

# Install golang and Install go-wkhtmltox
RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -yqq -o=Dpkg::Use-Pty=0 --no-install-recommends \
      git \
      wget \
 && mkdir -p /tmp/go \
    && cd /tmp/go \
    && wget -q https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz \
      && tar -C /usr/local -xzf  go1.9.1.linux-amd64.tar.gz \
    && mkdir -p $HOME/go \
      && export GOPATH=$HOME/go \
    && export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin \
    && go get github.com/gogap/go-wkhtmltox \
    && cd $GOPATH/src/github.com/gogap/go-wkhtmltox \
    && go build \
    && mkdir -p /app \
    && cp go-wkhtmltox /app \
    && cp -r templates  /app \
    && cp app.conf /app \
 && rm -rf /tmp/go/* \
    && rm -rf /usr/local/go \
    && rm -rf $GOPATH \
 && apt-get purge -y --auto-remove git wget \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean -yqq

WORKDIR /app

VOLUME /app/templates

CMD ["./go-wkhtmltox"]
