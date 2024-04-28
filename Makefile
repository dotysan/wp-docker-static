
.PHONY: start down clean

start:
	docker compose --progress=plain up --build

down:
	docker compose down

clean: down
	docker volume rm wordpress_dbvol wordpress_webroot
#	docker network rm wpnet
