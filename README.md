# Docker containers sharing the network stack and macOS access problem

We want to use the [Knora](http://www.knora.org/) services ecosystem as off-the-shelf docker containers.

Each service default configuration refer to others as running on  `localhost`; *webapi* expect to see *graphdb* listening on `localhost:7200` even though each one runs in a different container.

It is still possible if the containers share the same network stack, which docker does when called with the option: `docker run --net=host`.

On macOS, the network stack that they then share is the one of the virtual machine that runs the docker service, which is different from the macOS network stack. And the `--net=host` option stops the docker service to forward ports to macOS.
So the ecosystem service containers can talk to each others, but we can't access them within macOS.

Therefore the need to have a dockerized client.

# set-up

## graphdb

runs nicely

```bash
docker run --net=host --rm -it platec/graphdb-free-init-1.1.0
```

## knora

fix the hostname resolution.

When started the container updates the `/etc/hostname` to something like *linuxkit-025000000001* but doesn't put it in the `/etc/hosts`.

Unfortunately, the first thing that the `webapi` does is to grab the hostname and try to resolve it… it fails and exits.

```bash
# start docker with a bash as entry point
docker run --net=host --rm -it platec/webapi-1.1.0 bash
# find out the hostname
bash-4.4$ cat /etc/hostname
linuxkit-025000000001
# paste the hostname to localhost alias in /etc/hosts
bash-4.4$ vi /etc/hosts
# start the knora webapi
bash-4.4$ /webapi/webapi
```

## salsah

there must be something like for the webapi, so replace the scala web server by a simpler one:

```bash
# start the conainer with a bash entry point
docker run --net=host --rm -it dhlabbasel/salsah1 bash
# install python
bash-4.4$ apk update
bash-4.4$ apk upgrade
bash-4.4$ apk add python
# start a simple web server at the right place
bash-4.4$ cd /salsah/public
bash-4.4$ python -m SimpleHTTPServer 8080
```

## client

The client must be a linux running in a container with the same network settings.

We must be able to access it from within the macOS, for that we can share x11 apps:

```bash
# prepare the host, install XQuartz
# start XQuartz
# install socat
brew install socat
# run socat for for sharing X11
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
```

Finally start the client:

```bash
# start a client container
make build
make run
```

Or use the image from docker hub:

```bash
docker run --net=host -it --rm -e DISPLAY=docker.for.mac.host.internal:0 platec/knoradockerstackclient
```
