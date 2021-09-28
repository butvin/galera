 - Symfony Cli https://github.com/butvin/io-sys/wiki/Begin
 - 
***
# Galera
    
## Docker instructions:



### _HOT COMMANDS_

![image](https://user-images.githubusercontent.com/4057096/135031783-552868ac-193f-44c6-ab59-e712b28f6300.png)


 docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)


stopping & remove created containers

***

`docker exec -t php-fpm bash -c "php bin/console fos:user:create dev developer@email.com dev --super-admin"` - create account in database container (login/email/password: dev/developer@email.com/dev)

***

`docker rmi $(docker images -qa)` - remove all downloaded docker images

***

`docker volume rm $(docker volume ls -q)` - remove all volumes

***

`docker rm -v $(docker ps -aq)`  Все без исключения контейнеры будут удалены


`docker rm -v $(docker ps -q)`  Все активные контейнеры будут удалены


`docker rm -v $(docker ps -aq -f status=exited)`  Удаление всех неактивных контейнеров

***

`docker network rm $(docker network ls -q)` - remove all networks

***

`docker system prune -a -f` - clear system from temp-files

***

`docker network ls -q` - display networks

***

`docker volume ls -q` - display active volumes


### _VOLUMES ACTIONS_


`docker volume create $VOLUME_NAME` - Create a volume

`docker volume inspect $VOLUME_NAME` - Display detailed information on one or more volumes

<b style="color: tomato">docker volume prune $VOLUME_NAME</b> - Remove all unused local volumes

`docker volume rm $VOLUME_NAME` - Remove one or more volumes

***

`docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)`

`docker volume rm $(docker volume ls -q)`

`docker network rm $(docker network ls -q)`

`docker rmi $(docker images -qa)`

`docker system prune -a -f`

`sudo lsof -nP | grep LISTEN`


    sudo kill -9 1548
    sudo systemctl stop docker
    sudo systemctl start docker
    sudo systemctl status docker
    docker ps -a -s (with size)

`docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts`  adds localhost uri to /etc/hosts

***

`docker run --name mariadb -e ALLOW_EMPTY_PASSWORD=yes bitnami/mariadb:latest`

***

`curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-mariadb/master/docker-compose.yml > docker-compose.yml`


`docker-compose up -d`


***



`docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'`

***

###Script automatic set permissions for directories (SF-4.4)

    #!bin/sh<br>
    HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\ -f1)<br>
    sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var<br>
    sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var<br>


***

`docker-php-ext-configure`

`docker system df -v`   displays information regarding the amount of disk space used by the docker daemon
***
`docker stop $(docker ps -qa) && docker rm $(docker ps -qa)`    Stop & Drop all containers
`docker system df`       Show docker disk usage
***
`docker system events`    Get real time events from the server
***
`docker system info`     Display system-wide information
***
`docker system prune  -f`   Remove unused data

Also, can see a full list env values by running:

    php bin/console debug:container --env-vars
    php bin/console debug:container --parameters

`php bin/console config:dump-reference doctrine` displays the default config values DEFINED by Symfony




`php bin/console debug:config doctrine` displays the actual config values used by current app

##Containers, tools & features in Docker</h2>


> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ru/

***

https://docs.docker.com/engine/install/ubuntu/
---------------------------------------------------

UNINSTALL
---------
      sudo apt-get purge docker-ce docker-ce-cli containerd.io
      sudo rm -rf /var/lib/docker

INSTALL
-------
      sudo apt-get update
      sudo apt-get install \
         apt-transport-https \
         ca-certificates \
         curl \
         gnupg-agent \
         software-properties-common

***

> curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

***

`sudo rm -rf .docker/.dbdata/`

`sudo rm -rf composer.lock`

***

`cd ../usr/local/etc/php/conf.d/`

***

###WARNING: Found orphan containers (redis, database, rabbitmq) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.


***

debconf: delaying package configuration, since apt-utils is not installed
----------------------------------------------------
    ARG XDEBUG_VERSION=2.9.2
    RUN apk add --no-cache $PHPIZE_DEPS \
        && pecl install xdebug-${XDEBUG_VERSION}cat \
        && docker-php-ext-enable xdebug  \

***

    RUN apk add --no-cache \
        git \
        yarn \
        autoconf \
        g++ \
        make \
        openssl-dev

***

#### Install xdebug
    RUN docker-php-source extract \
        && pecl install xdebug \
        && echo "xdebug.remote_enable=on\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_autostart=on\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_port=9001\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_handler=dbgp\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_connect_back=1\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && docker-php-ext-enable xdebug \
        && docker-php-source delete \
        && rm -rf /tmp/*


***

`WORKDIR /var/www/html`
---------------------
`RUN docker-php-ext-install pdo pdo_mysql`
-----------------------------------
`RUN apk update`
--------------
`RUN apk upgrade`
-------------

#### xDebug ext with VSCODE

    `ENV` `XDEBUG_VERSION`=`2.9.2`<br>
    `RUN` apk --no-cache add --virtual `.build-deps`  
    `g++` `autoconf` `make` `pecl` install xdebug-${`XDEBUG_VERSION`} && \
        docker-php-ext-enable `xdebug` && \
        apk del `.build-deps` && \
        rm -r `/tmp/pear/*` && \
        echo -e "`xdebug.remote_enable=1`\
            `xdebug.remote_autostart=1` \
            `xdebug.remote_connect_back=0` \
            `xdebug.remote_port=3223` \
            `xdebug.idekey`=`'VSCODE'` \
            `xdebug.remote_log`=`/var/www/html/xdebug.log` \
            `xdebug.remote_host=host.docker.internal`" >> `/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini`



#### Change TimeZone

    RUN apk add --update tzdata
    ENV TZ=Europe/Bucharest    

#### Personal IP

    ip address
    ifconfig
    hostname -I

> >https://matthewsetter.com/setup-step-debugging-php-xdebug3-docker/ </small>

***

### `docker-compose config`

Usage: config [options]
Options:

`--resolve-image-digests` - Pin image tags to digest


`--no-interpolate` - Don't interpolate environment variables.<br>
`-q, --quiet` - Only validate the configuration, don't print anything.<br>
`--services` - Print the service names, one per line.<br>
`--volumes` - Print the volume names, one per line.<br>
`--hash="*"` - Print the service config hash, one per line. Set "service1, service2" for a list of specified services or use the wildcard symbol to display all services.




<hr>

## R&nbsp;E&nbsp;D&nbsp;I&nbsp;S

_Redis(TM)_ 

_https://registry.hub.docker.com/r/bitnami/redis#configuration_

`bridge-utils`
--------------

***

    shell
    sudo apt-get install bridge-utils -y
    brctl show

###ip a

bridge-utils command utility `brctl show` and use it to list the Linux bridges on your Docker host.


Use the `ip` command to view details of the `docker0` bridge


```dockerfile            
docker run --name redis -e ALLOW_EMPTY_PASSWORD=yes bitnami/redis:latest
curl -sSL https://raw.githubusercontent
com/bitnami/bitnami-docker-redis/master/docker-compose.yml > docker-compose.yml
docker-compose up -d
docker pull bitnami/redis:[TAG]
```

#####you can also build the image yourself:



`docker build -t bitnami/redis:latest 'https://github.com/bitnami/bitnami-docker-redis.git#master:6.2/debian-10'`

***

`Step 1`
--------

Create a network
        
    docker network create app-tier --driver bridge

`Step 2`
--------

Launch the Redis(TM) server instance
Use the --network app-tier argument to the docker run command to attach the Redis(TM) container to the app-tier network.

    docker run -d --name redis-server \
        -e ALLOW_EMPTY_PASSWORD=yes \
        --network app-tier \
        bitnami/redis:latest

`Step 3`
--------

Launch your Redis(TM) client instance
Finally we create a new container instance to launch the Redis(TM) client and connect to the server created in the previous step:

    docker run -it --rm \
        --network app-tier \
        bitnami/redis:latest redis-cli -h redis-server


**Using Docker Compose**
------------------------

When not specified, Docker Compose automatically sets up a new network and attaches all deployed services to that network. However, we will explicitly define a new bridge network named app-tier. In this example we assume that you want to connect to the Redis(TM) server from your own custom application image which is identified in the following snippet by the service name myapp.

```dockerfile

version: '2'


services:
  redis:
    image: 'bitnami/redis:latest'
    environment:
    - ALLOW_EMPTY_PASSWORD=yes
    networks:
    - app-tier
  app:
    image: YOUR_APPLICATION_IMAGE
    networks:
    - app-tier
    
    
networks:
  app-tier:
    driver: bridge
    
```




`IMPORTANT`
------------

Please update the `YOUR_APPLICATION_IMAGE` placeholder in the above snippet with your application image.

In your application container, use the hostname redis to connect to the Redis(TM) server Launch the containers using: `docker-compose up -d`

```docker



```

##Disabling Redis(TM) commands


For security reasons, you may want to disable some commands. You can specify them by using the following environment variable on the first run:

REDIS_DISABLE_COMMANDS: Comma-separated list of Redis(TM) commands to disable. Defaults to empty.


<h3>docker run --name redis -e REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL,CONFIG bitnami/redis:latest</h3>


Alternatively, modify the docker-compose.yml file present in this repository:

    services:
      redis:
      ...
        environment:
          - REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL,CONFIG
      ...
As specified in the docker-compose, `FLUSHDB` and `FLUSHALL` commands are disabled. Comment out or remove the environment variable if you don't want to disable any commands:

    services:
      redis:
      ...
        environment:
          - REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL



Passing extra command-line flags to the redis service command is possible by adding them as arguments to run.sh script:


```dockerfile

docker run \
    --name redis \
    -e ALLOW_EMPTY_PASSWORD=yes \
    bitnami/redis:latest /opt/bitnami/scripts/redis/run.sh --maxmemory 100mb
    
    
```

***

```dockerfile

services:
    redis:
        environment:
            - ALLOW_EMPTY_PASSWORD=yes
        command: /opt/bitnami/scripts/redis/run.sh --maxmemory 100mb   
```


Passing the `REDIS_PASSWORD` environment variable when running the image for the first time will set the Redis(TM) server password to the value of `REDIS_PASSWORD` (or the content of the file specified in `REDIS_PASSWORD_FILE`).

```dockerfile

docker run --name redis -e REDIS_PASSWORD=password123 bitnami/redis:latest
```

Alternatively, modify the docker-compose.yml file present in this repository:

    services:
        redis:
        ...
            environment:
                - REDIS_PASSWORD=redis

        ...


[`NOTE`](https://tilburgsciencehub.com/building-blocks/store-and-document-your-data/document-data/readme-best-practices/)

The at sign **`@`** is  supported for **REDIS_PASSWORD**.

[`WARNING`]() The Redis(TM) database is always configured with remote access enabled. It's suggested that the **REDIS_PASSWORD** env variable is always specified to set a password. In case you want to access the database without a password set the environment variable **ALLOW_EMPTY_PASSWORD = yes**. This is recommended only for development.


connecting via `redis-cli` utility

    docker run -it --network some-network --rm redis redis-cli -h some-redis


Files for database connection and migrations configuration are located in `/srv/doctrine` folder

```dockerfile

docker run -ti \
    -v $PWD/src/Migrations:/migrations \
    -e MIGRATIONS_PATH='/migrations' \
    -e DATABASE_URL='mysql://user:user_password@db/app' \
    -e MIGRATIONS_NAMESPACE='DoctrineMigrations' \
    --network=project
    
`docker-doctrine-migrations migrations:execute --up 'DoctrineMigrations\Version'`

```

####>Run build:

    docker build -f Dockerfile -t docker-doctrine-migrations --target final

***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***

#THE END
####to be continued...
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


    APP ENV:

APP_ENV=dev
APP_SECRET=ff647a684b3c27a710daec988484f83e
APP_DEBUG=true
APP_ADMIN_EMAIL=admin.io@mail.org
APP_ENABLE_V2_PROTOCOL=true
APP_SUPPORTED_LOCALES=["en","ru","ua"]
APP_NAME='GALERA.'

    DB SETTINGS
DATABASE_ALLOW_EMPTY_ROOT_PASSWORD='no'
DATABASE_ROOT_PASSWORD=root
DATABASE_LOG_CONSOLE='yes'
DATABASE_DRIVER=pdo_mysql
DATABASE_PORT=3306
DATABASE_DBNAME=app
DATABASE_USER=app
DATABASE_PASSWORD=app
DB_CHARSET='utf8'
DATABASE_VOLUME='.dbdata'


    DATABASE_URL
DATABASE_URL="mysql://app:app@db:3306/app?serverVersion=mariadb-10.6.4"



SERVER_VERSION='mariadb-10.6.4'
ALLOW_EMPTY_ROOT_PASSWORD='no'
UNIX_MYSQL_SOCKET=/run/mysqld/mysqld.sock



RABBITMQ_DEFAULT_USER=app
RABBITMQ_DEFAULT_PASS=app
RABBITMQ_DEFAULT_VHOST=/
    #Format described at https://www.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url
    #IMPORTANT: You MUST configure your server version, either here or in config/packages/doctrine.yaml
    #DATABASE_URL="sqlite:///%kernel.project_dir%/var/data.db"
    #DATABASE_URL="postgresql://db_user:db_password@127.0.0.1:5432/db_name?serverVersion=13&charset=utf8"
REDIS_PASSWORD=app
REDIS_VERSION=6.2.5



MESSENGER_TRANSPORT_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/



    MESSENGER
#MESSENGER_TRANSPORT_DSN=doctrine://default
DOCTRINE_MESSENGER_TRANSPORT_DSN=doctrine://default
HIGH_PRIORITY_MESSENGER_TRANSPORT_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/
LOW_PRIORITY_MESSENGER_TRANSPORT_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/
    #MESSENGER_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5672/%2f/main?connection_timeout=5
    #MESSENGER_TRANSPORT_DSN=amqp://guest:guest@localhost:5672/%2f/messages
    #MESSENGER_TRANSPORT_DSN=redis://localhost:6379/messages



    #MAILER_DSN
MAILER_DSN=sendmail://default
#MAILER_DSN=smtp://user:pass@smtp.example.com:port
#MAILER_DSN=smtp://localhost





PHP_VERSION=8.0.10
NGINX_VERSION=1.21.3
XDEBUG_VERSION=3.0.4
AMQP_VERSION=1.11.0beta



MONGO_PORT=27017
REDIS_PORT=6379
NGINX_PORT=80



CLIENT_TIMEZONE=Europe/Kiev
DOCKER_PHP_ENABLE_XDEBUG="on"
PHP_ENABLE_XDEBUG="on"



OS_ARCH=x86_64
OS_FLAVOUR=debian-10
OS_NAME=Linux


***

`MESSENGER_TRANSPORT_DSN`=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/?connection_timeout=5<br>
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
******
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***
***

#TODO RE RE
Выполните следующую команду на локальной машине:

    docker exec -i postgres psql --username user_name database_name < /path/to/dump/pgsql-backup.sql
или зайдите в контейнер postgres и выполните:

    `psql --username user_name database_name < /path/to/dump/pgsql-backup.sql
user_name — имя пользователя. Значение postgres_USER (см. файл .env).

database_name — название базы данных. Значение postgres_DB (см. файл .env).


###развернуть дамп MySQL


#### *Вариант 1*

Если требуется создать дополнительных пользователей, то следует это сделать перед началом процедуры загрузки дампа.

В файле `mysql/conf.d/config-file.cnf` отключите лог медленных запросов slow_query_log=0 или установите большое значение long_query_time, например 1000.

Если дамп сжат утилитой gzip, сначала следует распаковать архив:

    gunzip databases-dump.sql.gz

Затем можно развернуть дамп, выполнив на локальном компьютере команду:

    docker exec -i mysql mysql --user=root --password=secret --force < databases-dump.sql

Указывать пароль в командной строке — плохая практика, не делайте так в производственной среде.

MySQL выдаст справедливое предупреждение:

    mysql: [Warning] Using a password on the command line interface can be insecure

Ключ --force говорит MySQL, что ошибки следует проигнорировать и продолжить развёртывание дампа. Этот ключ иногда может пригодится, но лучше его без необходимости не применять.

#### **Вариант 2**

Воспользоваться утилитой Percona XtraBackup.

Percona **XtraBackup** — это утилита для горячего резервного копирования баз данных MySQL.

О том, как работать с XtraBackup можно узнать по ссылке: 

_https://vc.ru/dev/158815-sozdanie-rezervnoy-kopii-mysql-pri-pomoshchi-utility-xtrabackup_




























<section>
Test network connectivity


`TODO`
-----
<ul >
    <li>composer require doctrine/coding-standard</li>
    <li>squizlabs/php_codesniffer</li>
    <li>composer require --dev debug</li>
    <li></li>

!!! _*docker network inspect bridge*_


    apt-get install iputils-ping
    docker logs --tail 20 db






</ul>
</section>
