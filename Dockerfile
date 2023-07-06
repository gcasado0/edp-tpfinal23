FROM alpine

RUN apk update && apk add bash imagemagick curl

WORKDIR /app

ADD scripts scripts

ENTRYPOINT ["bash", "/app/scripts/test.sh"]
