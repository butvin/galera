FROM 8.1-rc-fpm
#FROM php:7.4-fpm
#8.1-rc-cli

ARG DEBIAN_FRONTEND=noninteractive

ARG env

RUN apt-get update && apt-get install -y \
        apt-utils \
        librabbitmq-dev \
        libimage-exiftool-perl \
        libzip-dev \
        zip \
        unzip \
        p7zip-full \
        sendmail \

RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache

#rabbitMQ
RUN pecl install amqp
RUN docker-php-ext-enable amqp

#xdebug php ext
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug \
    && touch /var/log/xdebug.log

#redis
RUN pecl install -o -f redis \
  &&  rm -rf /tmp/pear
RUN docker-php-ext-enable redis

#composer install
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /root/.bashrc && \
        composer


#RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
#RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint
#RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

COPY www.conf /usr/local/etc/php-fpm.d

COPY ${env}/opcache.ini "$PHP_INI_DIR"/conf.d
COPY ${env}/php.ini "$PHP_INI_DIR"/conf.d
COPY ${env}/xdebug.ini "$PHP_INI_DIR"/conf.d

WORKDIR "/app"