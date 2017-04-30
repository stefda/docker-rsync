# rsync

A simple rsync server that runs inside Docker. It is intended to be used as a volume and shared among containers where
standard volume sharing results in poor read performance.

# Usage

The simplest use case is to run the image and map its 873 port:

```$ docker run stefda/rsync -p 873:873```

The command above will spin up a container that listens on port 873 for rsync connections.
