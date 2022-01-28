FROM alpine:latest

RUN apk update \
 && apk add --no-cache \
            bash \
            postgresql \
            postgresql-client \
            python3

RUN python3 -m ensurepip

RUN pip3 install --no-cache --upgrade pip setuptools

RUN pip3 install --no-cache s3cmd python-magic

COPY application/ /data/

WORKDIR /data

CMD ["./entrypoint.sh"]
