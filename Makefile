
.PHONY: start down cli db dbdump clean

start:
	docker compose --progress=plain up --build

down:
	docker compose down

cli:
	docker run --rm -it --network=wpnet --volume=wordpress_webroot:/var/www/html \
	  --env=WORDPRESS_DB_HOST=wp-db \
	  --env=WORDPRESS_DB_NAME=${DB_NAME} \
	  --env=WORDPRESS_DB_USER=${DB_USER} \
	  --env=WORDPRESS_DB_PASSWORD=${DB_PASS} \
	  wordpress:cli-2.10-php8.3 bash

# TODO: can we pass the vars below implicitly instead of on cli?
db:
	docker run --rm -it --network=wpnet \
	  mariadb:11.3 \
	  mariadb --protocol=tcp --host=wp-db --user=${DB_USER} --password=${DB_PASS} ${DB_NAME}

dbdump:
	docker run --rm -it --network=wpnet \
	  mariadb:11.3 \
	  mariadb-dump --protocol=tcp --host=wp-db --user=${DB_USER} --password=${DB_PASS} ${DB_NAME}
# or
#	docker exec -it wordpress_wp-db mariaddb-dump --password ${DB_NAME}

clean: down
	docker volume rm wordpress_dbvol
