
.PHONY: start down cli clean

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

clean: down
	docker volume rm wordpress_dbvol wordpress_webroot
