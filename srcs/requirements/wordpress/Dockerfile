FROM debian:buster
ARG MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD VERSION=7.4
WORKDIR /var/www
RUN apt-get update -y
RUN apt-get install php php7.3-fpm php-mysql curl wget -y
RUN sed -i "s|listen = /run/php/php${VERSION}-fpm.sock|listen = 9000|g" /etc/php/${VERSION}/fpm/pool.d/www.conf
RUN wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip && rm -rf wp-config-sample.php && chmod -R 777 wp-content
RUN mkdir -p /run/php/
COPY ./tools/script.sh .
RUN chmod +x script.sh && ./script.sh
CMD ["/usr/sbin/php-fpm7.4", "-F"]
