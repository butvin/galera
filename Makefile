build: \
	docker-compose \
	install-dependencies \
	migrate \
	permissions \
	dashboard

docker-compose:
	docker-compose -f .docker/docker-compose.yml up -d --build

dev:
	docker-compose -f .docker/docker-compose.dev.yml up -d --build

cli:
	docker-compose -f .docker/docker-compose.cli.yml up -d --build

prod:
	docker-compose -f .docker/docker-compose.prod.yml up -d --build
	docker exec -t php-fpm bash -c 'COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --optimize-autoloader'
	docker exec -t php-fpm bash -c 'bin/console doctrine:migrations:migrate --no-interaction'

composer-install-dependencies:
	docker exec -t php-fpm bash -c "COMPOSER_MEMORY_LIMIT=-1 composer install"

doctrine-database-migrate:
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:migrate --no-interaction"
	docker exec -t php-fpm bash -c "php bin/console doctrine:migrations:sync-metadata-storage"
	docker exec -t php-fpm bash -c "php bin/console cache:clear"

permissions:
	docker exec -t php-fpm bash -c "bash /app/permissions.sh"

npm-install-dependencies:
	docker exec -t php-fpm bash -c "npm i -g npm && npm install"
	docker exec -t php-fpm bash -c "npx tailwindcss -o ./assets/styles/tailwind.css"
	docker exec -t php-fpm bash -c "npm run dev"

install-dependencies: \
	composer-install-dependencies \
	npm-install-dependencies

migrate: \
	doctrine-database-migrate

dashboard:
	docker exec -t php-fpm bash -c "php bin/console about && npm version"
	docker ps --format 'table {{ .Names}}\t{{ .Status}}\t{{ .Ports}}';


php:
	docker exec -it php-fpm bash -c "fish"

npm-nodejs:
	docker exec -it php-fpm bash -c "npm version"
	docker exec -it php-fpm bash -c 'npm run watch'

nginx:
	docker exec -it nginx bash

redis:
	docker exec -it redis sh

clear-hard:
	sh ./.docker/clear-hard.sh

clear-soft:
	sh ./.docker/clear-soft.sh
