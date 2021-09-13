build: \
	common \
	dev \
	composer-install \
	doctrine-migration \
	create-dev-acc


common:
	docker-compose \
			-f .docker/docker-compose.common.yml \
			up -d --build


dev:
	docker-compose \
			-f .docker/docker-compose.dev.yml \
			up -d --build


prod:
	docker-compose \
			-f .docker/docker-compose.prod.yml \
			up -d --build


composer-install:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install"


doctrine-migration:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console about"


create-dev-acc:
	docker exec -t php-fpm bash -c "php bin/console fos:user:create dev dev.dev@mail.org dev --super-admin"

php:
	docker exec -it php-fpm bash

remake:
	docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a) && make

permissions:
	sh ./run.sh