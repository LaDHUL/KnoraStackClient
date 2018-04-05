FROM dhlabbasel/salsah1

RUN apk update \
 && apk upgrade \
 && apk add python

WORKDIR /salsah/public

ENTRYPOINT ["/usr/bin/python", "-m", "SimpleHTTPServer",  "3335"]
