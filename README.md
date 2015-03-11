docker-grafana
==============

Grafana dashboard for InfluxDB docker container.


Build
-----

To create the image `bbinet/grafana`, execute the following command in the
`docker-grafana` folder:

    docker build -t bbinet/grafana .

You can now push the new image to the public registry:
    
    docker push bbinet/grafana


Configure and run
-----------------

You can configure the Grafana container with the environment variables of the
form `GF_<SECTION>_<KEY>` with sections and keys that are available in grafana
default configuration:
https://github.com/grafana/grafana/blob/develop/conf/defaults.ini

Then when starting your Grafana container, you will want to bind port `3000`
to the host external port.

For example:

    $ docker pull bbinet/grafana

    $ docker run --name grafana \
          -p 80:3000 \
          bbinet/grafana

