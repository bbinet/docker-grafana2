FROM debian:wheezy

MAINTAINER Bruno Binet <bruno.binet@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
#ENV GRAFANA_VERSION 2.0.0

RUN apt-get update && \
    apt-get install -yq libfontconfig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#ADD https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb /tmp/grafana.deb
ADD https://github.com/bbinet/grafana/releases/download/v2.0.0-prebeta2-f3d4d27/grafana_2.0.0-prebeta2_amd64.deb /tmp/grafana.deb
RUN dpkg -i /tmp/grafana.deb

EXPOSE 3000

CMD ["/opt/grafana/current/grafana", "--config", "/etc/grafana/grafana.ini", "web"]
