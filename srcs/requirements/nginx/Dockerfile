# FROM alpine:3.17
# RUN apk update && apk upgrade
# RUN apk add --no-cache nginx curl ca-certificates
# RUN cp /usr/share/nginx/http-default_server.conf /var/www/index.html
# RUN mkdir -p /etc/nginx/ssl
# RUN curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 \
#     && chmod +x mkcert-v1.4.4-linux-amd64 && mv mkcert-v1.4.4-linux-amd64 mkcert \
#     && mv mkcert /usr/local/bin/ && mkcert -install && mkcert -key-file /etc/nginx/ssl/zcherrad.42.fr.key -cert-file /etc/nginx/ssl/zcherrad.42.fr.crt zcherrad.42.fr
# COPY ./tools/index.html /var/www/
# COPY ./conf/nginx.conf /etc/conf.d/nginx.conf
# EXPOSE 443
# CMD ["nginx", "-g", "daemon off;"]
# FROM debian:stable

# # ENV DEBIAN_FRONTEND=noninteractive

# RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get clean && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils &&\
#     apt-get update && apt-get -y upgrade && apt-get install -y nginx curl ca-certificates &&\
#     cp /var/www/html/index.nginx-debian.html /var/www/index.html; \
#     mkdir /etc/nginx/ssl; \
#     curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 \
#     && chmod +x mkcert-v1.4.4-linux-amd64 && mv mkcert-v1.4.4-linux-amd64 mkcert \
#     && mv mkcert /usr/local/bin/ && mkcert -install && mkcert -key-file /etc/nginx/ssl/zcherrad.42.fr.key -cert-file /etc/nginx/ssl/zcherrad.42.fr.crt zcherrad.42.fr;

# EXPOSE 443

# # COPY ./conf/nginx.conf /etc/nginx/conf.d/
# COPY ./conf/nginx.conf /etc/nginx/sites-enabled/config.conf

# CMD ["nginx", "-g", "daemon off;"]
FROM alpine:3.17

RUN apk update && apk upgrade

RUN apk add nginx openssl --no-cache

RUN openssl req -x509 -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/zcherrad.42.fr.key -out /etc/ssl/private/zcherrad.42.fr.crt -subj "/C=MO/ST=student/L=Khouribga/O=1337/OU=company/CN=zcherrad"

# we copy the local configuration file to the container nginx folder
COPY ./conf/* /etc/nginx/http.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]