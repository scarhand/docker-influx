FROM debian:jessie

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget --no-check-certificate https://s3.amazonaws.com/influxdb/influxdb_0.10.0-1_amd64.deb && \
    dpkg -i influxdb_0.10.0-1_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    rm influxdb_0.10.0-1_amd64.deb

COPY influxdb.conf /etc/influxdb/influxdb.conf

# Admin server WebUI
EXPOSE 8083

# HTTP API
EXPOSE 8086

ENTRYPOINT ["influxd", "-config", "/etc/influxdb/influxdb.conf"]
