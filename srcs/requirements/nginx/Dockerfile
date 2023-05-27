FROM debian:buster
RUN apt-get update -y
RUN apt-get install -y nginx
RUN apt-get -y install openssl
RUN mkdir -p /etc/nginx/ssl/certs
RUN mkdir -p /etc/nginx/ssl/private
COPY ./tools/script.sh ./tmp/
RUN chmod +x /tmp/script.sh
RUN bash /tmp/script.sh
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
