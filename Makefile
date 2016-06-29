all: build

build:
	@docker build --tag=${USER}/postgresql .

run:
	@docker run --name postgresql -itd --restart always \
	  --publish 15432:5432 \
		--volume /srv/docker/postgresql:/var/lib/postgresql \
		${USER}/postgresql

console:
	@docker exec -it postgresql sudo -u postgres psql

release: build
	@docker build --tag=${USER}/postgresql:$(shell cat VERSION) .
