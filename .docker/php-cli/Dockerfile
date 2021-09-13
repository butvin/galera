FROM php:8.1-rc-cli

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        apt-utils \
        locales \
        librabbitmq-dev \
        libimage-exiftool-perl \
        libzip-dev \
        zip \
        unzip \
        p7zip-full \
        sendmail


# rabbitMQ
RUN pecl install amqp
RUN docker-php-ext-enable amqp


# xDebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN touch /var/log/xdebug.log


RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache


# Redis
RUN pecl install -o -f redis \
  &&  rm -rf /tmp/pear
RUN docker-php-ext-enable redis


# Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /root/.bashrc && \
        composer


# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen
RUN locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
#RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint
#RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

COPY php.ini "$PHP_INI_DIR"/conf.d
COPY xdebug.ini "$PHP_INI_DIR"/conf.d

WORKDIR "/app"

CMD cron -f