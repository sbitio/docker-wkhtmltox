# docker-wkhtmltox

This docker container lets you run wkhtmltopdf in a docker container.

## Building the image

```sh
docker build .
```

## Using the image

```sh
docker run -v <host_dir>:/tmp sbitio/wkhtmltopdf https://sbit.io /tmp/output.pdf
```

The mounted volume can be used to send local html files and to save
the output.

## Using as a service

We leverage [gogap/go-wkhtmltox](https://github.com/gogap/go-wkhtmltox/) to provide an as-a-service container on tag aas-latest:

```sh
docker run -d --rm --name wkhtmltox sbitio/wkhtmltox:aas-latest
curl -s -X POST \
  "http://$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wkhtmltox):8080/v1/convert" \
  -H 'accept-encoding: gzip' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
    "to" : "image",
    "converter":{
      "uri": "https://sbit.io"
    },
	  "template": "binary"
  }' --compressed -o sbit.jpg
docker stop wkhtmltox
```

## Authors and Contributors

This image was built at [sbit.io](https://sbit.io).
