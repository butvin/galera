ARG PHP_VERSION='8.0.11'
FROM php:${PHP_VERSION}-fpm

ENV DEBIAN_FRONTEND=noninteractive

ARG env

# libpng-dev needed by "gd" extension
# libzip-dev needed by "zip" extension
# libicu-dev for intl extension
# libpg-dev for connection to postgres database
# autoconf needed by "redis" extension
RUN set -eux; \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends --no-install-suggests -y \
        wget \
        git \
        libzip-dev \
        libicu-dev \
        zip \
        unzip \
        p7zip-full \
        libimage-exiftool-perl \
        sendmail \
        ca-certificates \
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
    && apt-get clean

RUN docker-php-ext-configure intl

RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache intl exif xsl

RUN pecl update-channels

## amqp
ARG AMQP_VERSION='1.11.0beta'
RUN pecl install amqp-${AMQP_VERSION}
RUN docker-php-ext-enable amqp

## xdebug
#ARG XDEBUG_VERSION='3.0.4'
#RUN pecl install xdebug-${XDEBUG_VERSION}
#RUN docker-php-ext-enable xdebug && touch /var/log/xdebug.log

## redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis

## nodejs/npm
RUN set -eux; \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - ; \
    apt-get install -y nodejs

## Symfony cli
RUN set -eux; \
    wget https://get.symfony.com/cli/installer -O - | bash; \
    mv $HOME/.symfony/bin/symfony /usr/local/bin/symfony; \
    symfony self:update

## composer
RUN set -eux; \
    curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> $HOME/.bashrc \
    && composer -V

#COPY ${project_root}/docker/php-fpm/docker-install-composer /usr/local/bin/docker-install-composer
#RUN chmod +x /usr/local/bin/docker-install-composer && \
#    docker-install-composer

RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint

RUN sed -i \
    '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' \
    /usr/local/bin/docker-php-entrypoint

COPY www.conf /usr/local/etc/php-fpm.d

COPY dev/php.ini "$PHP_INI_DIR"/conf.d
COPY dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY dev/xdebug.ini "$PHP_INI_DIR"/conf.d

RUN docker-php-source delete

RUN apt-get autoremove --purge -y \
    && rm -rf /tmp/pear \
    && apt-get autoclean -y \
    && apt-get clean -y

WORKDIR "/app"
