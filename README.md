<style>
    .title-shadow {
        position: absolute;
        top: 50%; 
        right: 50%;
        transform: translate(50%,-50%);
        text-transform: uppercase;
        font-family: Lucida" Grande, sans-serif;;
        font-size: 12em;
        font-weight: 700;
        color: #f5f5f5;
        text-shadow: 1px 1px 1px #919191,
            1px 2px 1px #919191,
            1px 3px 1px #919191,
            1px 4px 1px #919191,
            1px 5px 1px #919191,
            1px 6px 1px #919191,
            1px 7px 1px #919191,
            1px 8px 1px #919191,
            1px 9px 1px #919191,
            1px 10px 1px #919191,
        1px 18px 6px rgba(16,16,16,0.4),
        1px 22px 10px rgba(16,16,16,0.2),
        1px 25px 35px rgba(16,16,16,0.2),
        1px 30px 60px rgba(16,16,16,0.4);
    }
</style>

<main style="font-family: 'Lucida Console', monospace;">
<h1 style="color: #E0E3DA; font-size: 7rem; font-weight: normal; letter-spacing: 12px; line-height: 1; text-align: left; height: auto;" class="title-shadow">
GALERA.
</h1>

<h2 style="color: #111; font-family: 'Open Sans', sans-serif; font-size: 30px; font-weight: 900; line-height: 32px; margin: 0 0 72px; text-align: center">

</h2>


<hr style="background: #E0E3DA; height: 2px;">

`HOT ACTIONS`
----

<b style="color: tomato">
docker exec -t php-fpm bash -c "php bin/console fos:user:create dev developer@email.com dev --super-admin"
</b> - <span>create account in db container.<br><small>login: dev<br>email: developer@email.com<br>password:'dev'<br></small></span>
<hr>
<b style="color: tomato">docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)</b> - <span>stopping & remove all created containers</span><br>
<hr>
<b style="color: tomato">docker rmi $(docker images -qa)</b> - remove all downloaded docker images<br>
<b style="color: tomato">docker volume rm $(docker volume ls -q)</b> - remove all volumes<br>
<hr>
<b style="color: tomato">docker network rm $(docker network ls -q)</b> - remove all networks<br>
<hr>
<b style="color: tomato">docker system prune -a -f</b> - clear system from temp-files<br>
<hr>
<b style="color: tomato">docker network ls -q</b> - display n<hr>etworks<br>
<hr>
<b style="color: tomato">docker volume ls -q</b> - display active volumes<br>


`VOLUMES ACTIONS`
--------
<hr>
<ul style="list-style: none;">
    <li>
        <b style="color: tomato">docker volume create</b> - Create a volume
    </li>
    <li>
        <b style="color: tomato">docker volume inspect</b> - Display detailed information on one or more volumes
    </li>
    <li>
        <b style="color: tomato">docker volume prune</b> - Remove all unused local volumes
    </li>
    <li>
        <b style="color: tomato">docker volume ls</b> - List volumes
    </li>
    <li>
        <b style="color: tomato">docker volume rm</b>	- Remove one or more volumes
    </li>
</ul>

<hr style="background-image: linear-gradient(to right, #ea350e, #ff9600); height: 1px;">

<div style="background-image: linear-gradient(to right, rgba(131,96,195,0.9), rgba(46,191,145,0.1));">
    <p>
        <b style="color: tomato">
            docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
        </b>
    </p>
    <p>
        <b style="color: tomato">
            docker volume rm $(docker volume ls -q)
        </b>
    </p>
    <p>
        <b style="color: tomato">
            docker network rm $(docker network ls -q)
        </b>
    </p>
    <p>
        <b style="color: tomato">
            docker rmi $(docker images -qa)
        </b>
    </p>
    <p>
        <b style="color: tomato">
            docker system prune -a -f
        </b>
    </p>
    
    
    
    
    

</div>

<h2>sudo lsof -nP | grep LISTEN</h2>

<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 2px;">

    sudo kill -9 1548
    sudo systemctl stop docker
    sudo systemctl start docker
    sudo systemctl status docker
    docker ps -a -s (with size)

<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">
<hr style="background: linear-gradient(to right, #6E7783, #E0E3DA);">

`docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts` -  adds localhost uri to /etc/hosts

<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">

`docker run --name mariadb -e ALLOW_EMPTY_PASSWORD=yes bitnami/mariadb:latest`

<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">

    curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-mariadb/master/docker-compose.yml > docker-compose.yml
    docker-compose up -d


<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">

<p style="background-image: linear-gradient(to right, #2c3e50, #4ca1af);">

    docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'

</p>
<hr>

<h2 style="background-image: linear-gradient(to right, #c6ffdd, #fbd786, #f7797d); color: #444f59; padding: 20px; margin: 10px; border-radius: 2px">
<span style="color: black;">

Script automatic set permissions for directories (SF-4.4)

</span>
</h2>

<section style="background: #2E294E; padding: 20px; border-radius: 12px;">
#!bin/bash<br>
<div style="color: #dc5c5a; font-family: 'Lucida Console', monospace; font-weight: 200;">
HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\ -f1)<br>
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var<br>
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var<br>
</div>
</section>
<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">

    docker-php-ext-configure

<b style="color: tomato">`docker system df -v`</b> - <i>displays information regarding the amount of disk space used by the docker daemon</i>

<div style="background-image: linear-gradient(to right, #1e2022, #444f59);">

`docker stop $(docker ps -qa) && docker rm $(docker ps -qa)`    Stop & Drop all containers

`docker system df`       Show docker disk usage

<hr>

`docker system events`    Get real time events from the server

<hr>

`docker system info`     Display system-wide information

<hr>

`docker system prune  -f`   Remove unused data

</div>


<p>you can see a full list env values by running:</p>

    `php bin/console debug:container --env-vars`
    `php bin/console debug:container --parameters`


<p>displays the default config values DEFINED by Symfony</p>

`php bin/console config:dump-reference doctrine`



<p>displays the actual config values used by current app</p>
    `php bin/console debug:config doctrine`

<h2 style="color: #fffff3; font-weight: 200; font-family: 'Lato Heavy', monospace; font-size: 3em; letter-spacing: 7px;">Containers, tools & features in Docker</h2>


<small>https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ru/ </small>


<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">





<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

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

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

sudo rm -rf .docker/.dbdata/

sudo rm -rf composer.lock 

<hr style="background: #A593E0; height: 2px;">

 cd ../usr/local/etc/php/conf.d/

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

###WARNING: Found orphan containers (redis, database, rabbitmq) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.


<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

debconf: delaying package configuration, since apt-utils is not installed
----------------------------------------------------
    ARG XDEBUG_VERSION=2.9.2
    RUN apk add --no-cache $PHPIZE_DEPS \
        && pecl install xdebug-${XDEBUG_VERSION}cat \
        && docker-php-ext-enable xdebug  \

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

    RUN apk add --no-cache \
        git \
        yarn \
        autoconf \
        g++ \
        make \
        openssl-dev

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">

# Install xdebug
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

<hr style="background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3); height: 2px;">


`WORKDIR /var/www/html`
---------------------
`RUN docker-php-ext-install pdo pdo_mysql`
-----------------------------------
`RUN apk update`
--------------
`RUN apk upgrade`
-------------

# xdebug with VSCODE
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

<hr style="background: #EFDC05; height: 1px;">

Change TimeZone
----------------
    RUN apk add --update tzdata
    ENV TZ=Europe/Bucharest    

Personal IP
------------
    ip address
    ifconfig
    hostname -I

<small>https://matthewsetter.com/setup-step-debugging-php-xdebug3-docker/ </small>

<hr style="background: #EFDC05; height: 1px;">

<h2>`docker-compose config`</h2>
---------------------
Usage: config [options]<br>
<span>Options:</span>
<blockquote style="background: #E0E3DA; color: #566270; border-radius: 4px">
<b style="color: tomato">--resolve-image-digests</b> - Pin image tags to digests.<br>
<b style="color: #F17F42;">--no-interpolate</b> - Don't interpolate environment variables.<br>
<b style="color: #F17F42;">-q, --quiet </b> - Only validate the configuration, don't print anything.<br>
<b style="color: #F17F42;">--services</b> - Print the service names, one per line.<br>
<b style="color: #F17F42;">--volumes</b> - Print the volume names, one per line.<br>
<b style="color: #F17F42;">--hash="*"</b> - Print the service config hash, one per line. Set "service1, service2" for a list of specified services or use the wildcard symbol to display all services.<br>
</blockquote>
</main>




<hr>

<h1 style="font-family: 'Ubuntu Light', monospace; font-size: 10em; line-height: 1.3em; border-radius: 28px; letter-spacing: 24px; border-bottom: 4px solid whitesmoke; border-left: 4px solid whitesmoke; padding-left: 20px; margin-top: 40px;">R&nbsp;E&nbsp;D&nbsp;I&nbsp;S</h1>




<p>

_Redis(TM)_ *https://registry.hub.docker.com/r/bitnami/redis#configuration*
</p>

<section>

`bridge-utils`
--------------
<hr>
<p>
</p>
shell
sudo apt-get install bridge-utils -y
brctl show

ip a
```

<p>

`bridge-utils` command utility `brctl show` and use it to list the Linux bridges on your Docker host.
</p>

Use the `ip` command to view details of the `docker0` bridge


```dockerfile            
docker run --name redis -e ALLOW_EMPTY_PASSWORD=yes bitnami/redis:latest
curl -sSL https://raw.githubusercontent
com/bitnami/bitnami-docker-redis/master/docker-compose.yml > docker-compose.yml
docker-compose up -d
docker pull bitnami/redis:[TAG]
```

<p>

you can also build the image yourself:
</p>


    docker build -t bitnami/redis:latest 'https://github.com/bitnami/bitnami-docker-redis.git#master:6.2/debian-10'

</section>

<div style="background: #919191;">

`Step 1`
--------

Create a network
        
    docker network create app-tier --driver bridge

`Step 2`
------
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

<p>

When not specified, Docker Compose automatically sets up a new network and attaches all deployed services to that network. However, we will explicitly define a new bridge network named app-tier. In this example we assume that you want to connect to the Redis(TM) server from your own custom application image which is identified in the following snippet by the service name myapp.
</p>
<pre style="font-family: 'Lucida Sans', monospace">

version: '2'

networks:
  app-tier:
    driver: bridge
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
</pre>




`IMPORTANT`:
---------
<p>

Please update the `YOUR_APPLICATION_IMAGE` placeholder in the above snippet with your application image.
</p>
<p>

In your application container, use the hostname redis to connect to the Redis(TM) server
Launch the containers using: `docker-compose up -d`
</p>

```docker



```

<hr>

<h1>Disabling Redis(TM) commands</h1>

<pre>
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
As specified in the docker-compose, FLUSHDB and FLUSHALL commands are disabled. Comment out or remove the environment variable if you don't want to disable any commands:

services:
  redis:
  ...
    environment:
      # - REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL
</pre>


Passing extra command-line flags to the redis service command is possible by adding them as arguments to run.sh script:


```dockerfile
docker run \
    --name redis \
    -e ALLOW_EMPTY_PASSWORD=yes \
    bitnami/redis:latest /opt/bitnami/scripts/redis/run.sh --maxmemory 100mb
```


<hr>


```dockerfile
services:
    redis:
        environment:
            - ALLOW_EMPTY_PASSWORD=yes
        command: /opt/bitnami/scripts/redis/run.sh --maxmemory 100mb
```


<p>

Passing the `REDIS_PASSWORD` environment variable when running the image for the first time will set the Redis(TM) server password to the value of `REDIS_PASSWORD` (or the content of the file specified in `REDIS_PASSWORD_FILE`).
</p>

```dockerfile

docker run --name redis -e REDIS_PASSWORD=password123 bitnami/redis:latest

```

<p>Alternatively, modify the docker-compose.yml file present in this repository:</p>

    services:
        redis:
        ...
            environment:
                - REDIS_PASSWORD=redis

        ...

<p>

[`NOTE`](https://tilburgsciencehub.com/building-blocks/store-and-document-your-data/document-data/readme-best-practices/)
The at sign **`@`** is  supported for **REDIS_PASSWORD**.
</p>

<p>

[`WARNING`]() The Redis(TM) database is always configured with remote access enabled. It's suggested that the **REDIS_PASSWORD** env variable is always specified to set a password. In case you want to access the database without a password set the environment variable **ALLOW_EMPTY_PASSWORD = yes**. This is recommended only for development.
</p>

<p>

connecting via `redis-cli` utility
</p>


docker run -it --network some-network --rm redis redis-cli -h some-redis

<section>

<p>

Files for database connection and migrations configuration are located in `/srv/doctrine` folder
</p>

<section>

```dockerfile
docker run -ti \
    -v $PWD/src/Migrations:/migrations \
    -e MIGRATIONS_PATH='/migrations' \
    -e DATABASE_URL='mysql://user:user_password@db/app' \
    -e MIGRATIONS_NAMESPACE='DoctrineMigrations' \
    --network=project
    
docker-doctrine-migrations migrations:execute --up 'DoctrineMigrations\Version'
```
</section>

<h4>Run build:</h4>

<p style="color: rgba(142,45,226,0.8); font-family: 'Helvetica Neue', sans-serif; font-size: 14px; line-height: 24px; margin: 0 0 24px; text-align: justify; text-justify: inter-word;">

    docker build -f Dockerfile -t docker-doctrine-migrations --target final
</p>
<p>


</p>

</section>

<section style="font-family: 'Source Code Pro', monospace ; font-weight: 200; font-size: .85rem;">








































<div class="">
<h1>THE END</h1>
<h2>to be continued...</h2>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>


<div style="background: rgba(217,181,0,0.17)
; padding: .85em; margin: 0; list-style: none;">

`APP ENV:`
-----
`APP_ENV`=dev<br>
`APP_SECRET`=ff647a684b3c27a710daec988484f83e<br>
`APP_DEBUG`=true<br>
`APP_NAME`=GALERA.

`DB`
---------
`DATABASE_ALLOW_EMPTY_ROOT_PASSWORD`="no" \
`DATABASE_ROOT_PASSWORD`=root \
`DATABASE_LOG_CONSOLE`="yes" \
`DATABASE_DRIVER`=pdo_mysql \
`DATABASE_HOST`=127.0.0.1 \
`DATABASE_PORT`=3306 \
`DATABASE_DBNAME`=app \
`DATABASE_USER`=app \
`DATABASE_PASSWORD`=app \
`DATABASE_CHARSET`='utf8' \
`DATABASE_URL`="mysql://app:app@localhost:3306/app?serverVersion=mariadb-10.6.4" \
`SERVER_VERSION`='mariadb-10.6.4' 


`mysql/mariadb`
---------------
`MYSQL_ROOT_PASSWORD`=${DATABASE_ROOT_PASSWORD} \
`MYSQL_PASSWORD`=${DATABASE_PASSWORD} \
`MYSQL_HOST`=${DATABASE_HOST} \
`MYSQL_DATABASE`=${DATABASE_DBNAME} \
`MYSQL_USER`=${DATABASE_PASSWORD} \
`MYSQL_PORT`=${DATABASE_PORT} \
`MYSQL_ALLOW_EMPTY_PASSWORD`=${DATABASE_ALLOW_EMPTY_ROOT_PASSWORD} \
`MYSQL_LOG_CONSOLE`=${DATABASE_LOG_CONSOLE} \
`MYSQL_CHARSET`=${DATABASE_CHARSET} \

`rabbitmq`
----------
`RABBITMQ_DEFAULT_USER`=app<br>
`RABBITMQ_DEFAULT_PASS`=app<br>
`RABBITMQ_DEFAULT_VHOST`=/<br>

`redis`
-------
`REDIS_PASSWORD`=app<br>

`transports`
------------
`DOCTRINE_MESSENGER_TRANSPORT_DSN`=doctrine://default<br>
`MESSENGER_TRANSPORT_DSN`=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/?connection_timeout=5<br>
`HIGH_PRIORITY_MESSENGER_TRANSPORT_DSN`=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/?connection_timeout=5<br>
`LOW_PRIORITY_MESSENGER_TRANSPORT_DSN`=amqp://rabbitmq:rabbitmq@rabbitmq:5677/%2f/?connection_timeout=5<br>
`MAILER_DSN`=sendmail://default<br>
</div>


</section>





























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