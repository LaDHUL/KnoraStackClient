*This is part of the project of running a Knora stack with nearly stock images on a macOS machine.*

For some reasons the stock docker image refuses to start properly (apparently it starts but doesn't listen on port `3335`).

This quick and dirty workaround grabs the stock image, installs python and starts a web server in the `public` directory.

It is published on docker hub as [platec/knoradockerstacksalsah1](platec/knoradockerstacksalsah1) so you can run it as:

```bash
docker run --net=host -it --rm --name knoradockersalsah1 platec/knoradockerstacksalsah1
```

