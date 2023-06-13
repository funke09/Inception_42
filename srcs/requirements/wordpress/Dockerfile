FROM alpine:3.17
# ENV DB_NAME=${MYSQL_DATABASE} \
#     DB_USER=${MYSQL_USER} \
#     DB_PASSWORD=${MYSQL_PASSWORD} \
#     DB_HOST=mariadb \
#     DB_CHARSET=utf8 \
#     DB_COLLATE= \
#     WP_DEBUG=false \
#     WP_REDIS_HOST=redis \
#     WP_REDIS_PORT=6379 \
#     WP_CACHE=true
WORKDIR /var/www/
RUN apk update && apk upgrade
RUN apk add --no-cache php php-fpm php-phar php-mysqli php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip wget unzip curl php-tokenizer
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip && chmod -R 777 wp-content
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp > /dev/null
# RUN chmod 777 /usr/local/bin/wp
# COPY ./tools/wp-config.php .
COPY ./tools/script.sh .
# COPY ./tools/filePage.html .

# RUN chmod 777 ./filePage.html

RUN chmod +x ./script.sh
CMD ["./script.sh"]
