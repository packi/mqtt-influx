FROM debian:stable

MAINTAINER Patrick Stählin <me@packi.ch>

RUN apt-get update -y
RUN apt-get install -y mosquitto-clients influxdb-client jq

ADD run.sh /run.sh

ENTRYPOINT /run.sh
