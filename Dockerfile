FROM alpine

WORKDIR /app
RUN apk add --update-cache \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

COPY ./requirements.txt /app
RUN pip install -r requirements.txt

RUN apk update && apk add bash

COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

COPY . /app

CMD ./entrypoint.sh
