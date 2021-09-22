build: \
	docker-compose-main \
	dev \
	cli \
	composer-install-dependencies \
	doctrine-database-migrate

docker-compose-main:
	docker-compose -f .docker/docker-compose.yml up -d --build

dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build

cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build

prod:
	docker-compose -f .docker/docker-compose.prod.yml up -d --build
	docker exec -t php-fpm bash -c 'COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --optimize-autoloader'
	docker exec -t php-fpm bash -c 'bin/console doctrine:migrations:migrate --no-interaction'
#
composer-install-dependencies:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install --version"
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

doctrine-database-migrate :
	#docker exec -t php-fpm bash -c "php bin/console doctrine:database:create"
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:sync-metadata-storage"
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "composer diagnose"



### COMMON COMMANDS: ##################################################################################################
db:
	docker run -it --network docker_app_network --rm mariadb:10.6.4 mysql -h db -P 3306 -u app -p app
make-dev-account:
	docker exec -t php-fpm bash -c "php bin/console fos:user:create 'dev' 'development@mail.org' dev --super-admin"
worker-log:
	docker-compose -f .docker/docker-compose.cli.yml logs -f worker
worker-reload:
	docker-compose -f .docker/docker-compose.cli.yml exec worker bin/console cache:clear
	docker-compose -f .docker/docker-compose.cli.yml restart
db-log:
	docker logs db
php:
	docker exec -it php-fpm bash
nginx:
	docker exec -it nginx bash
clear:
	docker stop $(docker ps -q -a) && \
	docker rm $(docker ps -q -a) && \
	sudo rm -rf .docker/.dbdata/
#######################################################################################################################












migrate:
	docker run -ti \
		  -v $PWD/src/Migrations:/migrations \
		  -e MIGRATIONS_PATH='/migrations' \
		  -e DATABASE_URL='mysql://user:user_password@db/app' \
		  -e MIGRATIONS_NAMESPACE='DoctrineMigrations' \
		  --network=project \
		  docker-doctrine-migrations migrations:execute --up 'DoctrineMigrations\Version20210602174439'

	docker build -f Dockerfile -t docker-doctrine-migrations --target final

redis:
	docker run \
		-e ALLOW_EMPTY_PASSWORD=yes \
		-v /path/to/redis-persistence:/bitnami/redis/data \
		bitnami/redis:latest

#docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a)


db-up:
	docker run \
		--name db \
		-e MYSQL_ROOT_PASSWORD=root \
		-d mariadb:10.6.4 \
		--character-set-server=utf8mb4 \
		--collation-server=utf8mb4_unicode_ci

	#docker run -p 127.0.0.1:3306:3306  --name db -e MARIADB_ROOT_PASSWORD=root -d db mariadb:10.6.4
#	docker run -d -p 3306:3306 --blkio-weight=250 --memory=512M  -v ~/mdbdata/mdb10:/var/lib/mysql --name mdb10 mariadb:10.0

db-all-dump:
	docker exec -it db bash -c "exec mysqldump --all-databases -u app -p app" > /app/dumps/all-databases.sql

clear-all:
	docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a) && \
	docker rmi -f $(docker images -qa) && \
	docker volume rm $(docker volume ls -q) && \
	docker network rm $(docker network ls -q) && \
	docker system prune --volume -a -f; && \
	docker run --rm -v  /app/.docker/.dbdata chmod 777 -R && \
	sudo rm -R .docker/.dbdata

clear-hard:
	bash ./.docker/docker-execute.sh  --debugger

execute-sh:
	sh ./run.sh


misc:
	docker run \
	--name some-mariadb -v \
	.docker/.dbdata:/var/lib/mysql -e \
	MARIADB_ROOT_PASSWORD=root -d mariadb:10.6.4