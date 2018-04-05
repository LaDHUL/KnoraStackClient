*This is part of the project of running a Knora stack with nearly stock images on a macOS machine.*

For some reasons in the stock docker image the `webapi` application looks for the `hostname` and tries to resolve it.

Whe running with the `--net=host` the `hostname` is set to a given value that is not resolvable because it is missing from the file `/etc/hosts`.

This quick and dirty workaround only grabs the stock image, add the given host name to `/etc/hosts` and starts knora.

It is published on docker hub as platec/knoradockerstackknora so you can run it as:

```bash
docker run --net=host -it --rm --name knoradockersalsah1 platec/knoradockerstackknora
```

