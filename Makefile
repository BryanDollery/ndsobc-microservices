
build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

logs:
	docker-compose logs -f

test:
	@curl -sX POST localhost:8080/wibble | jq

clean:
	docker rm -f $$(docker ps -qa)

release:
	make -C source build push
	make -C sink build push

k8s:
	make -C source k8s
	make -C sink k8s
