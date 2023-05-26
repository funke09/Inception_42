FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN mkdir -p /etc/nginx/ssl/certs
RUN mkdir -p /etc/nginx/ssl/private
COPY ./tools/script.sh .
RUN chmod +x script.sh
EXPOSE 443
CMD ["sh", "script.sh"]
