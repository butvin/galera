build: \
	up \
	composer-install \
	migrate-db \
	docker-compose config


docker-compose:
	docker-compose -f .docker/docker-compose.yml up -d --build

dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build

cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build

prod:
	docker-compose -f .docker/docker-compose.prod.yml up -d --build

composer-install:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install"

migrate-db:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console about"

dev-account:
	docker exec -t php-fpm bash -c "php bin/console fos:user:create dev dev.admin@mail.org dev --super-admin"

up: \
	docker-compose \
	dev \
	cli \

database-up:
	docker run -d -p 3306:3306 -v .data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD --name mariadb mariadb:10.6.4
	docker run -d -p 3302:3306 --blkio-weight=250 --memory=512M  -v ~/mdbdata/mdb10:/var/lib/mysql --name mdb10 mariadb:10.0


php:
	docker exec -it php-fpm bash

worker-log:
	docker-compose -f .docker/docker-compose.cli.yml logs -f worker

worker-reload:
	docker-compose -f .docker/docker-compose.cli.yml exec worker bin/console cache:clear
	docker-compose -f .docker/docker-compose.cli.yml restart

cache-clear:
	docker volume rm docker_data
	sudo rm -R .docker/.data
#	docker run --rm -v  /app/.docker/.database chmod 777 -R
#	sudo chmod 777 -R .docker/.database


remake:
	docker stop $(docker ps -q -a) 	&& docker rm $(docker ps -q -a) \
	&& make

permissions:
	sh ./run.sh