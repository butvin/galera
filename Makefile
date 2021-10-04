build: \
	up \
	install-dependencies \
	database-migrate \
	permissions \
	summary

up:
	docker-compose \
		-f .docker/docker-compose.common.yml \
		-f .docker/docker-compose.dev.yml \
		-f .docker/docker-compose.cli.yml \
		up -d --build

production:
	##ATTENTION: Not delete! Comment/uncomment on 'prod' environment.
	cp ./.env ./.env.prod
	docker-compose -f .docker/docker-compose.prod.yml up -d --build
	docker exec -t php-fpm bash -c 'COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --optimize-autoloader'
	docker exec -t php-fpm bash -c 'bin/console doctrine:migrations:migrate --no-interaction'

install-dependencies:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install --ansi --no-interaction --no-scripts --prefer-dist"
		#"COMPOSER_MEMORY_LIMIT=-1 composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist"
	docker exec -t php-fpm bash -c "npm install -g npm && npm install"
	docker exec -it php-fpm bash -c "npm run dev"

database-migrate:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:sync-metadata-storage"
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

permissions:
	docker exec -t php-fpm bash -c "bash ./permissions.sh"
summary:
	docker exec -t php-fpm bash -c "php bin/console about && npm version"
	docker ps --format 'table {{ .Names }}\t{{ .Status }}\t{{ .Ports }}'
#----------------------------------------------------------------------------------------------------------------------
db:
	docker exec -i -t db bash -c "mysql --host=localhost -uroot --password=root --port=3306 app"

npm:
	docker exec -it php-fpm bash -c "npm run dev && npm run watch"

nginx:
	docker exec -it nginx bash

php:
	docker exec -it php-fpm bash
#docker exec -t php-fpm bash -c "npx tailwindcss -o ./assets/styles/tailwind.css"
php-c-c:
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

re:
	sh ./.docker/rebuild-containers.sh
clear-soft:
	sh ./.docker/clear-soft.sh

clear-hard:
	sh ./.docker/clear-hard.sh
