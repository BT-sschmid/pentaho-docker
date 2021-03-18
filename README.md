# Pentaho Data Integration in a Docker Image

As of Ubuntu 20.04 Pentaho 9.1 is broken due to missing ubuntu packages.
To work around this, this Docker Image based on Ubuntu 18.04 was created.

Odoo plugin is integrated

Pentaho is installed to `/opt/pentaho`

## Usage

```shell
docker run \
  -e DISPLAY=$DISPLAY  \
  -e db=dbname \
  -e host=hostname \
  -e user=username \
  -e pw=password \
  -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/src
```

or with docker-compose
```yaml
version: "3"
services:
  pentaho:
      image: btsschmid/pentaho-di
      environment:
        - DISPLAY=$DISPLAY
        - UBUNTU_MENUPROXY=0
        - db=thurbo
        - host=web
        - user=admin
        - pw=admin
        - port=8069
      volumes:
        - /tmp/.X11-unix:/tmp/.X11-unix
        - ./:/src
        #- ./repos/bt-transportation/transformation/export/kettle.properties:/root/.kettle/kettle.properties
      #command: "/opt/pentaho/spoon.sh -D db=thurbo -D host=web"
      depends_on:
        - web
```