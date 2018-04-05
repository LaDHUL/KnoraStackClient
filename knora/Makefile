image=platec/knoradockerstackknora:latest
container=knoradockerknora
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
	docker run --net=$(network) -it --rm --name $(container) $(image)

start:
	docker start $(container)

attach:
	docker attach $(container)

login:
	docker login

push:
	docker push $(image)
