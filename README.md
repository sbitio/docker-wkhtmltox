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

We leverage [gogap/go-wkhtmltox](https://github.com/gogap/go-wkhtmltox/) to provide an as-a-service container on tag aas-latest.

## Authors and Contributors

This image was built at [sbit.io](https://sbit.io).
