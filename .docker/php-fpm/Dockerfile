ARG PHP_VERSION='8.0.10'
FROM php:${PHP_VERSION}-fpm
LABEL version=${PHP_VERSION}

ENV DEBIAN_FRONTEND noninteractive

#ARG DATA="${DATABASE_VOLUME}"
#RUN mkdir /app/.docker/$DATA_STORAGE
#RUN chown $(whoami):$(whoami) -R /app/.docker/$DATA_STORAGE

#ARG env

#RUN mkdir $DATA_STORAGE
#RUN chmod 777 -R $DATA_STORAGE
#RUN chown 'www-data':'www-data' -R $DB_STORAGE
#COPY ../../run.sh /run.sh
#RUN chmod +x /run.sh
#RUN chmod 777 /app/.docker/.data -R

#ADD ./.data/ /var/lib/mysql
#RUN chown $(whoami):$(whoami) -R /app/.docker/.data
#RUN chown $(whoami):$(whoami) -R $DATA_STORAGE

#RUN apk update && apk upgrade
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends curl wget

#RUN apk add --no-cache tree git aptitude
#RUN rm -rf /var/cache/apk/*
RUN apt-get install -y --no-install-recommends \
    zip \
    unzip \
    p7zip-full \
    libimage-exiftool-perl \
    sendmail \
    librabbitmq-dev \
    libzip-dev
#     ca-certificates \
#     tree \
#     make \
#     git \
#     bzip2 \
#    libxml2-dev \
#    libgmp-dev \
#    libffi-dev \
#    libssl-dev \
#    libcurl4-openssl-dev \
#    gcc \
#    g++ \
#    libonig-dev

#RUN rm -rf /var/lib/apt/lists/*

# rabbitmq
RUN pecl install amqp-1.11.0beta
RUN docker-php-ext-enable amqp

# required exts
RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache

# additional extensions
#RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install bcmath
#RUN docker-php-ext-install simplexml
#RUN docker-php-ext-install exif #read meta data of pictures
#RUN docker-php-ext-install sockets
#RUN docker-php-ext-install pcntl #PCNTL is the abbreviation of process control)
#RUN docker-php-ext-install gmp
#RUN docker-php-ext-install ffi #communication with 'C'
#№RUN docker-php-ext-install -j$(nproc) #PHP CPU Core Detection https://github.com/WyriHaximus/php-cpu-core-detector

#xdebug
#RUN pecl install -o -f xdebug-3.0.4
#RUN docker-php-ext-enable xdebug
#RUN touch /var/log/xdebug.log

#redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis
#RUN rm -rf /tmp/pear

WORKDIR "/app"

RUN wget https://get.symfony.com/cli/installer -O - | bash

#VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

#composer install
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && \
    echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /$HOME/.bashrc \
    && composer

# sendmail
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint


#config
COPY www.conf /usr/local/etc/php-fpm.d

#ext configs
COPY ./dev/php.ini "$PHP_INI_DIR"/conf.d
COPY ./dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY ./dev/xdebug.ini "$PHP_INI_DIR"/conf.d

# drop temp files
RUN docker-php-source delete

# clean temp installation files
RUN apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y

EXPOSE 9000





#########################################################################
#debconf: delaying package configuration, since apt-utils is not installed
#make: Circular jit/zend_jit.lo <- jit/zend_jit.lo dependency dropped.



#calendar ctype  dba dom
#enchant exif ffi fileinfo filter ftp gd gettext
#hash iconv imap intl  ldap   oci8
#odbc  pcntl
# pdo_dblib pdo_firebird  pdo_oci pdo_odbc pdo_pgsql pdo_sqlite
#pgsql phar posix pspell readline reflection session
# shmop  snmp soap  sodium
#spl standard sysvmsg sysvsem sysvshm tidy
# tokenizer  xmlreader xmlwriter xsl zend_test
#
#$ docker run -p 127.0.0.1:3306:3306  --name some-mariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw -d mariadb:tag





#docker run -p 127.0.0.1:3306:3306  --name db -e MARIADB_ROOT_PASSWORD=root -d mariadb:10.6.4




#7a0cb4175dc78746edd6698fe87e1f1ec4a4432222e639889fc401c0c8deba77
#docker: Error response from daemon: driver failed programming external connectivity on endpoint app (517653e3beae08d6b306fa2d2ec288319def83a12be814d808510e4f79fb3919): Error starting userland proxy: listen tcp4 127.0.0.1:3306: bind: address already in use.

