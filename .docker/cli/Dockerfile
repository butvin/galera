ARG PHP_VERSION='8.0.11'
FROM php:${PHP_VERSION}-cli

ARG env

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y --no-install-recommends --no-install-suggests -y \
        zip \
        unzip \
        p7zip-full \
        librabbitmq-dev \
        libzip-dev \
        sendmail \
        libimage-exiftool-perl \
        locales \
        ca-certificates \
    && apt-get clean -y

RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache

RUN pecl update-channels

ARG AMQP_VERSION='1.11.0beta'
RUN pecl install -o -f amqp-${AMQP_VERSION}
RUN docker-php-ext-enable amqp

RUN pecl install -o -f redis
RUN docker-php-ext-enable redis && \
    rm -rf /tmp/pear

## composer
#RUN set -eux; \
#    curl -sS https://getcomposer.org/installer | php -- \
#        --filename=composer \
#        --install-dir=/usr/local/bin \
#    && echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> $HOME/.bashrc \
#    && composer -V

RUN sed -i \
    -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' \
    /etc/locale.gen \
&& locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## sendmail
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint

RUN sed -i \
    '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' \
    /usr/local/bin/docker-php-entrypoint

COPY php.ini "$PHP_INI_DIR"/conf.d

RUN docker-php-source delete

RUN rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear \
    && apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y

WORKDIR /app

CMD cron -f