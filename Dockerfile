FROM alpine:3.5
MAINTAINER Niklas Rust <rust@qabel.de>

RUN apk add 
	--no-cache \
	linux-headers \
	uwsgi \
	py-pip \
	alpine-sdk \
	bash \
	postgresql-dev \
	uwsgi-python3 && \
apk add \
	--no-cache \
	--repository http://nl.alpinelinux.org/alpine/3.4/main \
	python3-dev && \
pip3 install -U \
	virtualenv \
	requests \
	pip 
ADD . /app
WORKDIR /app
COPY Docker/invoke.yml qabel.yaml
ENTRYPOINT ["bash", "entrypoint.sh"]
EXPOSE 8881 