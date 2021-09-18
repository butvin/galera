<main style="font-family: 'Lucida Console', monospace;">

## ___the Galley RESTFull API___
###Symfony 5.3


<i style="color: tomato"></i>
---------


<div style="background: linear-gradient(to right, #6E7783, #566270); color: #FFFFFF; border-radius: 2px; padding: 10px;">

`HOT`

<b style="color: tomato">docker exec -t php-fpm bash -c "php bin/console fos:user:create dev developer@email.com dev --super-admin"</b> - <span>create account in db container.<br><small>login: dev<br>email: developer@email.com<br>password:'dev'<br></small></span>

<b style="color: tomato">docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)</b> - <span>stopping & remove all created containers</span><br>

<b style="color: tomato">docker rmi $(docker images -qa)</b> - remove all downloaded docker images<br>

<b style="color: tomato">docker volume rm $(docker volume ls -q)</b> - remove all volumes<br>

<b style="color: tomato">docker network rm $(docker network ls -q)</b> - remove all networks<br>

<b style="color: tomato">docker system prune -a -f</b> - clear system from temp-files<br>

<b style="color: tomato">docker network ls -q</b> - display networks<br>

<b style="color: tomato">docker volume ls -q</b> - display active volumes<br>

`VOLUMES`

<ul>
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



</div>
<hr style="background-image: linear-gradient(to right, #ea350e, #ff9600); height: 1px;">








<div style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91);">

    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
    docker volume rm $(docker volume ls -q)
    docker network rm $(docker network ls -q)
    docker rmi $(docker images -qa)
    docker system prune -a -f

</div>

###sudo lsof -nP | grep LISTEN

<hr style="background-image: linear-gradient(to right, rgba(131,96,195,0.42), #2ebf91); height: 1px;">

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

docker stop $(docker ps -qa) && docker rm $(docker ps -qa)    Stop & Drop all containers

docker system df       Show docker disk usage

<hr>

docker system events    Get real time events from the server

<hr>

docker system info     Display system-wide information

<hr>

`docker system prune  -f`   Remove unused data

</div>

<hr>

<hr>


<p>you can see a full list env values by running:</p>

    `php bin/console debug:container --env-vars`
    `php bin/console debug:container --parameters`




<p>displays the default config values DEFINED by Symfony</p>

`php bin/console config:dump-reference doctrine`



<p>displays the actual config values used by current app</p>
    `php bin/console debug:config doctrine`

#___DOCKER___

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

<section>

TODO:
-----
<ul>
<li>composer require doctrine/coding-standard</li>
<li>squizlabs/php_codesniffer</li>
<li>composer require --dev debug</li>
</ul>
</section>


<div>

`App`
-----
`APP_ENV`=dev<br>
`APP_SECRET`=ff647a684b3c27a710daec988484f83e<br>
`APP_DEBUG`=true<br>
`APP_NAME`=GALERA<br>

`DB`
---------
`DATABASE_ALLOW_EMPTY_ROOT_PASSWORD`="no"<br>
`DATABASE_ROOT_PASSWORD`=root<br>
`DATABASE_LOG_CONSOLE`="yes"<br>
`DATABASE_DRIVER`=pdo_mysql<br>
`DATABASE_HOST`="127.0.0.1"<br>
`DATABASE_PORT`="3306"<br>
`DATABASE_DBNAME`=app<br>
`DATABASE_USER`=app<br>
`DATABASE_PASSWORD`=app<br>
`DB_CHARSET`='UTF8'<br>
`DATABASE_VOLUME`=".dbdata"<br>
`DATABASE_URL`=<small>"mysql://app:app@localhost:3306/app?serverVersion=mariadb-10.6.4"</small><br>
`SERVER_VERSION`="mariadb-10.6.4"<br>


`mysql/mariadb`
---------------
`MYSQL_ROOT_PASSWORD`=${DB_ROOT_PASSWORD}<br>
`MYSQL_PASSWORD`=${DB_PASSWORD}<br>
`MYSQL_HOST`=${DB_HOST}<br>
`MYSQL_DATABASE`=${DB_DBNAME}<br>
`MYSQL_USER`=${DB_PASSWORD}<br>
`MYSQL_PORT`=${DB_PORT}<br>
`MYSQL_ALLOW_EMPTY_PASSWORD`=${DB_ALLOW_EMPTY_PASSWORD}<br>
`MYSQL_LOG_CONSOLE`=${DB_LOG_CONSOLE}<br>
`MYSQL_CHARSET`=${DB_CHARSET}<br>

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