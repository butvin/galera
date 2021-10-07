build: \
	main \
	cli \
	install-dependencies \
	database-migrate \
	set-permissions \
	summary

main:
	docker-compose -f .docker/docker-compose.main.yml up -d --build

dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build

cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build

prod:
	cp ./.env ./.env.prod
	docker-compose -f .docker/docker-compose.prod.yml up -d --build
	docker exec -t php-fpm bash -c 'COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --optimize-autoloader'
	docker exec -t php-fpm bash -c 'bin/console doctrine:migrations:migrate --no-interaction'

install-dependencies:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer i --ansi --no-interaction --no-progress --no-scripts --prefer-dist"
	docker exec -t php-fpm bash -c "npm install -g npm && npm install"
	docker exec -it php-fpm bash -c "npm run dev"

database-migrate:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:sync-metadata-storage"
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

set-permissions:
	docker exec -t php-fpm bash -c "bash ./permissions.sh"

summary:
	docker exec -t php-fpm bash -c \
		"set -e; php bin/console about && npm version && symfony self:version"
	docker ps --format 'table \t{{ .Names }}\t{{ .Status }}\t{{ .Ports }}'

#----------------------------------------------------------------------------------------------------------------------
db:
	docker exec -i -t db bash -c "mysql --host=localhost -uroot --password=root --port=3306 app"

npm:
	docker exec -i -t php-fpm bash -c "npm run dev && npm run watch"

nginx:
	docker exec -it nginx bash

php:
	docker exec -it php-fpm bash
#docker exec -t php-fpm bash -c "npx tailwindcss -o ./assets/styles/tailwind.css"
php-cc:
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

ps:
	docker ps --format 'table {{ .Names }}\t\t{{ .Status }}\t{{ .Size }}'

re:
	sh ./.docker/rebuild-containers.sh

clear-soft:
	sh ./.docker/clear-soft.sh

clear-hard:
	sh ./.docker/clear-hard.sh
