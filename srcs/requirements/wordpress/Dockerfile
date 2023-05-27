# FROM debian:buster
# ARG MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD VERSION=7.4
# WORKDIR /var/www
# RUN apt-get update -y
# RUN apt-get install php php7.3-fpm php-mysql curl wget -y
# # RUN apt install -y php${VERSION} php${VERSION}-fpm php${VERSION}-mysqli php${VERSION}-json php${VERSION}-curl php${VERSION}-dom php${VERSION}-exif php${VERSION}-fileinfo php${VERSION}-mbstring php${VERSION}-xml php${VERSION}-zip wget unzip
# RUN sed -i "s|listen = /run/php/php${VERSION}-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf
# RUN wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip && rm -rf wp-config-sample.php && chmod -R 777 wp-content
# RUN mkdir -p /run/php/
# COPY ./tools/script.sh .
# RUN chmod +x script.sh && ./script.sh
# CMD ["/usr/sbin/php-fpm7.4", "-F"]
FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG VERSION=7.4

WORKDIR /var/www

RUN apt-get update -y \
    && apt-get install -y \
        curl \
        wget \
        unzip \
        apt-transport-https \
        lsb-release \
        ca-certificates

# Add the ondrej/php repository
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update -y \
    && apt-get install -y \
        php${VERSION} \
        php${VERSION}-fpm \
        php${VERSION}-mysql \
        php${VERSION}-json \
        php${VERSION}-curl \
        php${VERSION}-dom \
        php${VERSION}-exif \
        php${VERSION}-fileinfo \
        php${VERSION}-mbstring \
        php${VERSION}-xml \
        php${VERSION}-zip

RUN sed -i "s|listen = /run/php/php${VERSION}-fpm.sock|listen = 9000|g" /etc/php/${VERSION}/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && cp -rf wordpress/* . \
    && rm -rf wordpress latest.zip \
    && rm -rf wp-config-sample.php \
    && chmod -R 777 wp-content

RUN mkdir -p /run/php/

COPY ./tools/script.sh .
RUN chmod +x script.sh \
    && ./script.sh
CMD ["/usr/sbin/php-fpm7.4", "-F"]
# CMD ["/usr/sbin/php-fpm${VERSION}", "-F"]
