FROM php:8.0.10-cli

ARG DEBIAN_FRONTEND=noninteractive

ARG env

RUN apt-get update && apt-get upgrade -y && apt-get install apt-utils -y

RUN apt-get install -y \
    zip \
    curl \
    unzip \
    p7zip-full \
    librabbitmq-dev \
    libimage-exiftool-perl \
    libzip-dev \
    locales \
    sendmail

# rabbitmq/amqp
RUN pecl install -o -f amqp-1.11.0beta
RUN docker-php-ext-enable amqp

#required ext
RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache

# xdebug
#RUN pecl install -o -f xdebug-3.0.4
#RUN docker-php-ext-enable xdebug
#RUN touch /var/log/xdebug.log

# redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis
RUN rm -rf /tmp/pear

# composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && \
    echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /$HOME/.bashrc && \
    composer

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

#delete temporary files
RUN docker-php-source delete

#clean temp files
RUN apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y

WORKDIR "/app"

CMD cron -f