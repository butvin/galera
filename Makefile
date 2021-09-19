build: \
	docker-compose \
	dev \
	cli \
	composer-deploy \
	migrate-database

docker-compose:
	docker-compose -f .docker/docker-compose.yml up -d --build

dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build

cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build

prod:
	docker-compose -f .docker/docker-compose.prod.yml up -d --build

composer-deploy:
	docker exec -t php-fpm bash -c \
		"COMPOSER_MEMORY_LIMIT=-1 composer install --no-interaction --prefer-dist --all-or-nothing"

migrate-database:
	docker exec -t php-fpm bash -c \
		"php bin/console doctrine:migrations:migrate --no-interaction --all-or-nothing"
	docker exec -t php-fpm bash -c "php bin/console about"

dev-acc:
	docker exec -t php-fpm bash -c "php bin/console fos:user:create 'dev' 'development@mail.org' dev --super-admin"

worker-log:
	docker-compose -f .docker/docker-compose.cli.yml logs -f worker

worker-re:
	docker-compose -f .docker/docker-compose.cli.yml exec worker bin/console cache:clear
	docker-compose -f .docker/docker-compose.cli.yml restart

# technic common commands:
db:
	docker exec -it db bash
php:
	docker exec -it php-fpm bash











nginx:
	docker run --name web1 -d -p 8080:80 nginx:

migrate:
	docker run -ti \
		  -v $PWD/src/Migrations:/migrations \
		  -e MIGRATIONS_PATH='/migrations' \
		  -e DATABASE_URL='mysql://user:user_password@db/app' \
		  -e MIGRATIONS_NAMESPACE='DoctrineMigrations' \
		  --network=project \
		  pashak09/docker-doctrine-migrations migrations:execute --up 'DoctrineMigrations\Version20210602174439'

	docker build -f Dockerfile -t docker-doctrine-migrations --target final

redis:
	docker run \
		-e ALLOW_EMPTY_PASSWORD=yes \
		-v /path/to/redis-persistence:/bitnami/redis/data \
		bitnami/redis:latest


clear-data:
	docker exec -t php-fpm bash -c "rm -R /app/.docker/.dbdata"





db-log:
	docker logs db

db-up:
	docker exec -it db bash
	docker run -p 127.0.0.1:3306:3306  --name app -e MARIADB_ROOT_PASSWORD=root -d db mariadb:10.6.4
#	docker run -d -p 3306:3306 --blkio-weight=250 --memory=512M  -v ~/mdbdata/mdb10:/var/lib/mysql --name mdb10 mariadb:10.0

db-dump:
	docker exec -it db bash -c "exec mysqldump --all-databases -u root -p root" > /app/dumps/all-databases.sql

cache-clear:
	docker volume rm docker_dbdata
	sudo rm -R .docker/.dbdata
	docker run --rm -v  /app/.docker/.dbdata chmod 777 -R
	sudo chmod 777 -R .docker/.dbdata

drop-all:
	docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a) && \
	docker rmi $(docker images -qa) && \
	docker volume rm $(docker volume ls -q) && \
	docker network rm $(docker network ls -q) && \
	docker system prune -a -f

sh-run:
	sh ./run.sh


misc:
	docker run \
	--name some-mariadb -v .docker/.dbdata:/var/lib/mysql -e \
	MARIADB_ROOT_PASSWORD=root -d mariadb:10.6.4