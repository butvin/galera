ARG PHP_VERSION='8.0.10'
FROM php:${PHP_VERSION}-fpm

ENV DEBIAN_FRONTEND noninteractive

ENV XDEBUG_VERSION='3.0.4'
ENV AMQP_VERSION='1.11.0beta'

ARG env

RUN set -eux; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y --no-install-recommends --no-install-suggests -y \
        wget \
        curl \
        zip \
        unzip \
        libzip-dev \
        p7zip-full \
        ca-certificates \
        autoconf \
        iputils-ping \
        net-tools \
        apt-utils \
        libimage-exiftool-perl \
        sendmail \
        librabbitmq-dev \
        libicu-dev \
     && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure intl
RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache intl

# rabbitmq
RUN pecl install amqp-${AMQP_VERSION}
RUN docker-php-ext-enable amqp

# xdebug
RUN pecl install -o -f xdebug-${XDEBUG_VERSION}
RUN docker-php-ext-enable xdebug
RUN touch /var/log/xdebug-fpm.log

# redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN rm -rf /tmp/pear

# composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && \
    echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /root/.bashrc && \
    composer && \
    composer diagnose

# todo:
# ensure www-data user exists
#RUN set -eux; \
#	adduser -u 82 -D -S -G www-data www-data

RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint


COPY www.conf /usr/local/etc/php-fpm.d
#todo: change env
COPY dev/php.ini "$PHP_INI_DIR"/conf.d
COPY dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY dev/xdebug.ini "$PHP_INI_DIR"/conf.d

# remove & clean temporary files
RUN docker-php-source delete

RUN set -eux; \
    apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && apt-get update

WORKDIR "/app"
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




# docker run -p 127.0.0.1:3306:3306  --name some-mariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw -d mariadb:tag
#docker run -p 127.0.0.1:3306:3306  --name db -e MARIADB_ROOT_PASSWORD=root -d mariadb:10.6.4





#ARG DBVOLUME=$DATABASE_VOLUME
#RUN mkdir /app/.docker/$DATABASE_VOLUME
#RUN chown $(whoami):$(whoami) -R /app/.docker/$DATABASE_VOLUME
#RUN mkdir $DATABASE_VOLUME
#RUN chmod 777 -R $DATABASE_VOLUME
#RUN chown 'www-data':'www-data' -R $DATABASE_VOLUME
#COPY ../../run.sh /run.sh
#RUN chmod +x /run.sh
#RUN chmod 777 /app/.docker/$DATABASE_VOLUME -R
#ADD ../$DATABASE_VOLUME/ /var/lib/mysql