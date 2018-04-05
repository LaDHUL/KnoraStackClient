image=platec/knoradockerstackclient:20180404
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
