ARG PHP_VERSION=8.0.10

ENV PHP_VERSION=${PHP_VERSION}
FROM php:${PHP_VERSION}-fpm

#ADD file:d2abf27fe2e8b0b5f4da68c018560c73e11c53098329246e3e6fe176698ef941 in /
CMD ["bash"]

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN set -ex; \
  apt-get update;

if ! which gpg; \
    then  apt-get install -y --no-install-recommends gnupg; \
fi;

if ! gpg --version | grep -q '^gpg (GnuPG) 1\.';  \
    then apt-get install -y --no-install-recommends dirmngr && \
        rm -rf /var/lib/apt/lists/* \
fi;

ENV GOSU_VERSION=1.13

RUN set -eux; \
    apt-get update; \

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates

savedAptMark="$(apt-mark showmanual)"; \

    apt-get install -y --no-install-recommends wget; \
    rm -rf /var/lib/apt/lists/*; \

    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \

    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \

    export GNUPGHOME="$(mktemp -d)"; \

    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    gpgconf --kill all; \

    rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \

    apt-mark auto '.*' > /dev/null; \

    [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; \

    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    chmod +x /usr/local/bin/gosu; \
    gosu --version; \
    gosu nobody true

RUN mkdir /docker-entrypoint-initdb.d

RUN set -ex;
 	apt-get update; \

    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libjemalloc2 \
        pwgen \
        tzdata \
        xz-utils \
        zstd \
    ; \

    rm -rf /var/lib/apt/lists/*
ARG GPG_KEYS=177F4010FE56CA3336300305F1656F24C74CD1D8
# ARGS: GPG_KEYS=177F4010FE56CA3336300305F1656F24C74CD1D8
RUN set -ex;
export GNUPGHOME="$(mktemp -d)"; \
     	for key in $GPG_KEYS;  \
        do \
     		gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
     	done; \

     	gpg --batch --export $GPG_KEYS > /etc/apt/trusted.gpg.d/mariadb.gpg; \
     	command -v gpgconf > /dev/null && gpgconf --kill all || :; 	rm -fr "$GNUPGHOME"; \
    	apt-key list \

ARG MARIADB_MAJOR=10.6
ENV MARIADB_MAJOR=10.6
ARG MARIADB_VERSION=1:10.6.4+maria~focal
ENV MARIADB_VERSION=1:10.6.4+maria~focal
ARG REPOSITORY=http://archive.mariadb.org/mariadb-10.6.4/repo/ubuntu/ focal main
# ARGS:
#    GPG_KEYS=177F4010FE56CA3336300305F1656F24C74CD1D8
#    REPOSITORY=http://archive.mariadb.org/mariadb-10.6.4/repo/ubuntu/ focal main
RUN set -e;
	echo "deb ${REPOSITORY}" > /etc/apt/sources.list.d/mariadb.list; \
     	{
     		echo 'Package: *'; \
     		echo 'Pin: release o=MariaDB'; \
     		echo 'Pin-Priority: 999'; \
     	} > /etc/apt/preferences.d/mariadb

# ARGS: GPG_KEYS=177F4010FE56CA3336300305F1656F24C74CD1D8 REPOSITORY=http://archive.mariadb.org/mariadb-10.6.4/repo/ubuntu/ focal main
RUN set -ex;
 	{
        echo "mariadb-server-$MARIADB_MAJOR" mysql-server/root_password password 'unused'; \
     		echo "mariadb-server-$MARIADB_MAJOR" mysql-server/root_password_again password 'unused'; \
     	} | debconf-set-selections; \
     	apt-get update; \
     	apt-get install -y \
     		"mariadb-server=$MARIADB_VERSION" \
     		mariadb-backup \
     		socat \
     	; \
     	rm -rf /var/lib/apt/lists/*; \
     	rm -rf /var/lib/mysql; \
     	mkdir -p /var/lib/mysql /var/run/mysqld; \
     	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
     	chmod 777 /var/run/mysqld; \
     	find /etc/mysql/ -name '*.cnf' -print0 | xargs -0 grep -lZE '^(bind-address|log|user\s)' | xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/'

VOLUME [ /var/lib/mysql ]

COPY file:12b2a6a332e2002415e548cd024d4bdcdc90745b28f202869ff2d205d7a8c8cc in /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]