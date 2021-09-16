build: \
	up \
	composer \
	db-migrate


docker-compose:
	docker-compose -f .docker/docker-compose.yml up -d --build
dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build
cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build
prod:
	docker-compose -f .docker/docker-compose.prod.yml up -d --build
composer:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install --no-interaction --prefer-dist"
db-migrate:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console about"
up: \
	docker-compose \
	dev \
	cli
dev-account:
	docker exec -t php-fpm bash -c "php bin/console fos:user:create dev dev@mail.org dev --super-admin"






db:
	#docker exec -it db bash -c "mysql -u app -p app -h localhost app"
	docker run --link db:db -p 8080:8080 db

db-log:
	docker logs db

db-up:
	docker exec -it db bash
#	docker run -d -p 3306:3306 -v .data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD --name mariadb mariadb:10.6.4
#	docker run -d -p 3302:3306 --blkio-weight=250 --memory=512M  -v ~/mdbdata/mdb10:/var/lib/mysql --name mdb10 mariadb:10.0

db-dump:
	docker exec db sh -c 'exec mysqldump --all-databases -u root -p root' > /app/dumps/all-databases.sql

php:
	docker exec -it php-fpm bash

worker-log:
	docker-compose -f .docker/docker-compose.cli.yml logs -f worker

worker-reload:
	docker-compose -f .docker/docker-compose.cli.yml exec worker bin/console cache:clear
	docker-compose -f .docker/docker-compose.cli.yml restart

cache-clear:
	docker volume rm docker_db
	sudo rm -R .docker/.db
#	docker run --rm -v  /app/.docker/.database chmod 777 -R
#	sudo chmod 777 -R .docker/.database


drop-all:
	docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a)
	docker rmi $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)
	docker system prune -af

permissions:
	sh ./run.sh