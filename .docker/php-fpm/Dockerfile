ARG PHP_VERSION='8.0.10'
FROM php:${PHP_VERSION}-fpm

ENV DEBIAN_FRONTEND=noninteractive

ENV XDEBUG_VERSION='3.0.4'
ENV AMQP_VERSION='1.11.0beta'

ARG env

RUN set -eux; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y --no-install-recommends --no-install-suggests -y \
        wget \
        iproute2 \
        curl \
        zip \
        unzip \
        libzip-dev \
        libxml2 \
        p7zip-full \
        ca-certificates \
        autoconf \
        iputils-ping \
        net-tools \
        apt-utils \
        bridge-utils \
        libimage-exiftool-perl \
        sendmail \
        librabbitmq-dev \
        libicu-dev \
     && rm -rf /var/lib/apt/lists/*
#        build-essential \
#        libpng-dev \
#       iproute2
#        libjpeg62-turbo-dev \
#        libfreetype6-dev \
#        locales \
#        jpegoptim optipng pngquant gifsicle \

RUN docker-php-ext-configure intl

RUN docker-php-ext-install \
     zip \
     mysqli pdo pdo_mysql intl \
     opcache
#RUN docker-php-ext-install  mbstring zip exif pcntl
#RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
#RUN docker-php-ext-install gd
#RUN docker-php-ext-install bcmath
#RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install sodium
#RUN docker-php-ext-install exif
#RUN docker-php-ext-install pcntl
# rabbitmq


RUN set -eux; \
    pecl install amqp-${AMQP_VERSION}
#    geoip \

RUN docker-php-ext-enable amqp
#     \geoip


RUN  set -eux; \
    pecl install -o -f xdebug-${XDEBUG_VERSION}
RUN docker-php-ext-enable xdebug && \
    touch /var/log/xdebug-fpm.log


# redis
RUN pecl install -o -f redis # --with-php-config=/usr/local/etc/php/
RUN docker-php-ext-enable redis && \
    rm -rf /tmp/pear

#todo
#RUN set -eux; \
#    apt-get install node   -y


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

#todo: change env
COPY www.conf /usr/local/etc/php-fpm.d
COPY dev/php.ini "$PHP_INI_DIR"/conf.d
COPY dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY dev/xdebug.ini "$PHP_INI_DIR"/conf.d

# remove & clean temporary files
RUN docker-php-source delete

RUN set -eux; \
    apt-get autoremove --purge -y; \
    apt-get autoclean -y; \
    apt-get clean -y; \
    apt-get update


WORKDIR "/app"
#########################################################################

#intl
#sodium
#xsl
#ftp
#iconv
#phar
#dom
#gettext
#filter
#session
#readline
#tokenizer
#xmlreader
#xmlwriter
#---try---
# spl
#--------------------------------------
#fileinfo
#gd
#exif
#ldap


#unnesessary-------------------------------------------------------------

#enchant
#calendar
###DEBUG
#reflection
#########################################################################

#ffi
#ctype
#hash
#odbc
#oci8
### DB ext
#pgsql pdo_dblib pdo_firebird  pdo_oci pdo_odbc pdo_pgsql pdo_sqlite
#dba

#pcntl
#imap  #позволяют работать с протоколом IMAP, а также NNTP, POP3 и локальными методами доступа к почтовому ящику.
#posix
#pspell
#reflection
#shmop
#snmp
#soap
#standard
#sysvmsg
#sysvsem
#sysvshm
#tidy

#zend_test


#debconf: delaying package configuration, since apt-utils is not installed
#make: Circular jit/zend_jit.lo <- jit/zend_jit.lo dependency dropped.
#docker run -p 127.0.0.1:3306:3306  --name db -e MARIADB_ROOT_PASSWORD=root -d mariadb:10.6.4

