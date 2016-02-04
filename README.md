# docker-influx

A minimal container for running an influx server. By default all data will be stored in `/data`.

Usage
-----
    docker run -it --rm -v "$PWD":/data scarhand/influxdb:0.10
