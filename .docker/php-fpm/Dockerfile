FROM php:8.0.10-fpm

ARG DEBIAN_FRONTEND=noninteractive
ARG env

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y --no-install-recommends \
    wget \
    git \
    zip \
    curl \
    unzip \
    bzip2 \
    p7zip-full \
    libimage-exiftool-perl \
    sendmail \
    librabbitmq-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    ca-certificates \
    ; \
    	rm -rf /var/lib/apt/lists/*
#    wget \
#    make \
#    tree \
#    gcc \
#    g++ \
#    libgmp-dev \
#    libffi-dev \
#    libxml2-dev \
#    libssl-dev \
#    libcurl4-openssl-dev


# rabbitmq
RUN pecl install amqp-1.11.0beta
RUN docker-php-ext-enable amqp


RUN docker-php-ext-install zip mysqli pdo pdo_mysql opcache
#RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install bcmath
#RUN docker-php-ext-install simplexml
#RUN docker-php-ext-install exif
#RUN docker-php-ext-install sockets
#RUN docker-php-ext-install pcntl
#RUN docker-php-ext-install gmp
#RUN docker-php-ext-install ffi
#RUN docker-php-ext-install -j$(nproc)

#xdebug
RUN pecl install -o -f xdebug-3.0.4
RUN docker-php-ext-enable xdebug
#    && touch /var/log/xdebug.log

#redis
RUN pecl install -o -f redis
RUN docker-php-ext-enable redis && rm -rf /tmp/pear

#composer install
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && \
    echo "alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'" >> /root/.bashrc && \
    composer

# sendmail
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
RUN sed -i "/#!\/bin\/sh/aservice sendmail restart" /usr/local/bin/docker-php-entrypoint
RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

WORKDIR '/app'

# configs
COPY www.conf /usr/local/etc/php-fpm.d

COPY ./dev/php.ini "$PHP_INI_DIR"/conf.d
COPY ./dev/opcache.ini "$PHP_INI_DIR"/conf.d
COPY ./dev/xdebug.ini "$PHP_INI_DIR"/conf.d

# Drop temp files
RUN docker-php-source delete
# Clean temp files
RUN apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean -y


#calendar ctype  dba dom
#enchant exif ffi fileinfo filter ftp gd gettext gmp
#hash iconv imap intl  ldap mbstring mysqli oci8
#odbc  pcntl
# pdo_dblib pdo_firebird  pdo_oci pdo_odbc pdo_pgsql pdo_sqlite
#pgsql phar posix pspell readline reflection session
# shmop simplexml snmp soap  sodium
#spl standard sysvmsg sysvsem sysvshm tidy
# tokenizer  xmlreader xmlwriter xsl zend_test
