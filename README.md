# rsync

A minimalist image with rsync daemon. It is intended to be used as a volume and shared among containers where standard volume sharing results in poor read performance.

# Usage

The simplest use case is to run the image and map its 873 port:
```bash
$ docker run stefda/rsync -p 873:873
```

The command above spins up a container that will listen on port 873 for connections over the native rsync protocol. Syncing files is then as easy as `rsync -rtR <file-or-directory> rsync://<docker-host-ip>:873/volume`.

# Configuration

The module path, owning user, group and allowed hosts are all configurable via environmental variables. Launch fully customised container like so:

```bash
$ docker run stefda/rsync -p 873:873 -e VOLUME=/my/volume -e USER=www-data -e GROUP=www-data -e ALLOW="192.168.0.0/16 10.0.0.0/16"
```

# Using the image with docker-compose

An example usage with docker-compose:
 
```yaml
version: '2'
services:
  rsync-volume:
    image: stefda/rsync
    volumes:
      - /var/www/app/src
    environment:
      VOLUME: /var/www/app
      USER: www-data
      GROUP: www-data
    ports:
      - 10873:873
      
  web:
    image: my-app-image
    volumes_from:
      - rsync-volume
```

As defined, the `web` service will have volumes from the `rsync-volume` service and so any files synced into the rsync container will be immediately available in `web` as well. 
