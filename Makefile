image=platec/knoradockerstackclient:latest
container=knoradockerclient
network=host

check:
	docker ps | grep $(container)

stop:
	docker kill $(container)

rm:
	docker rm $(container)

rmi:
	docker rmi $(image)

build:
	docker build -f Dockerfile -t $(image) .

force-build:
	docker build --no-cache -f Dockerfile -t $(image) .

run:
	docker run --net=$(network) -it --rm -e DISPLAY=docker.for.mac.host.internal:0 --name $(container) $(image)

start:
	docker start $(container)

attach:
	docker attach $(container)

login:
	docker login

push:
	docker push $(image)

run-graphdb:
	docker run --net=host --rm -it platec/graphdb-free-init-1.1.0

open-graphdb:
	docker exec knoradockerclient firefox localhost:7200

open-knora:
	docker exec knoradockerclient firefox localhost:3333/v1/vocabularies

open-salsah:
	docker exec knoradockerclient firefox localhost:3335/index.html
