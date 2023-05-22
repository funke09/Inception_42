# Use the official WordPress image as the base
FROM debian:buster

# Install php-fpm package
RUN apt-get update && apt-get upgrade -y && apt-get install curl -y

RUN apt-get install -y php-fpm php-mysql
# Configure php-fpm
# RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /usr/local/etc/php/php.ini
# Set the entrypoint to start php-fpm
ENTRYPOINT ["wordpress", "-g", "daemon off;"]
