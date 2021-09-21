ARG PHP_VERSION='8.0.10'
FROM php:${PHP_VERSION}-cli

ENV DEBIAN_FRONTEND noninteractive

ARG env

ENV XDEBUG_VERSION='3.0.4'

ENV AMQP_VERSION='1.11.0beta'

RUN set -eux; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y --no-install-recommends \
        zip \
        unzip \
        wget \
        curl \
        apt-utils \
        ca-certificates \
        autoconf \
        iputils-ping \
        net-tools \
        p7zip-full \
        librabbitmq-dev \
        libimage-exiftool-perl \
        libzip-dev \
        locales \
        libicu-dev \
        sendmail \
     && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure intl
RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache intl

# rabbitmq/amqp
RUN pecl install -o -f amqp-$AMQP_VERSION
RUN docker-php-ext-enable amqp

# xdebug
RUN pecl install -o -f xdebug-$XDEBUG_VERSION
RUN docker-php-ext-enable xdebug
RUN touch /var/log/xdebug-cli.log

# redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN rm -rf /tmp/pear

# composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin \
    && echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /root/.bashrc \
    && composer \
    && composer diagnose

# settings
RUN sed -i "/en_US.UTF-8/s/^# //g" /etc/locale.gen
RUN locale-gen

# locales & languages
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# sendmail
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

# Config ini files
COPY php.ini "$PHP_INI_DIR"/conf.d
COPY xdebug.ini "$PHP_INI_DIR"/conf.d

# remove & clean temporary files
RUN docker-php-source delete

RUN set -eux; \
    apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && apt-get update

WORKDIR "/app"

CMD cron -f