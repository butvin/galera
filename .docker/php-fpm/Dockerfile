ARG PHP_VERSION='8.0.10'
FROM php:${PHP_VERSION}-fpm

ENV DEBIAN_FRONTEND=noninteractive

ENV XDEBUG_VERSION='3.0.4'
ENV AMQP_VERSION='1.11.0beta'

ARG env

# libpng-dev needed by "gd" extension
# libzip-dev needed by "zip" extension
# libicu-dev for intl extension
# libpg-dev for connection to postgres database
# autoconf needed by "redis" extension
RUN set -eux; \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends --no-install-suggests -y \
        curl wget libzip-dev libicu-dev zip unzip p7zip-full sendmail ca-certificates \
        acl \
        locales \
        libmcrypt-dev \
        libssl-dev \
        libxslt-dev \
        iproute2 \
        gnupg \
        libxml2 \
        libxml2-dev \
        autoconf \
        libpng-dev \
        libjpeg-dev \
        libimage-exiftool-perl \
        librabbitmq-dev \
        build-essential \
        fish \
        iputils-ping \
        net-tools \
        apt-utils \
        bridge-utils \
        libfreetype6-dev \
    && pecl install amqp-$AMQP_VERSION \
    && pecl install xdebug-$XDEBUG_VERSION \
    && pecl install redis \
    && apt-get clean  \
#    libjpeg62-turbo-dev jpegoptim\
#    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-configure intl

RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache intl exif gd xsl
#RUN docker-php-ext-install  mbstring  pcntl
#RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
#RUN docker-php-ext-install bcmath

RUN docker-php-ext-enable \
    amqp \
    xdebug \
    redis \
    && rm -rf /tmp/pear


#RUN pecl install xdebug-${XDEBUG_VERSION}
#RUN docker-php-ext-enable xdebug \
#    && touch /var/log/xdebug-fpm.log

# redis
#RUN pecl install -o -f redis # --with-php-config=/usr/local/etc/php/
#RUN docker-php-ext-enable redis \
#    && rm -rf /tmp/pear

# nodejs/npm
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install


# Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash; \
    mv $HOME/.symfony/bin/symfony /usr/local/bin/symfony


# Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin \
    && echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> $HOME/.bashrc \
    && composer -V
#    && composer diagnose

# install 2 Composer
#COPY ${project_root}/docker/php-fpm/docker-install-composer /usr/local/bin/docker-install-composer
#
#RUN chmod +x /usr/local/bin/docker-install-composer && \
#    docker-install-composer


RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint


COPY www.conf /usr/local/etc/php-fpm.d

COPY dev/php.ini "$PHP_INI_DIR"/conf.d
COPY dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY dev/xdebug.ini "$PHP_INI_DIR"/conf.d

# remove & clean temporary files
RUN docker-php-source delete
RUN apt-get autoremove --purge -y && \
    apt-get autoclean -y && \
    apt-get clean -y


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

