FROM debian:buster
RUN apt-get update -y
RUN apt-get install -y nginx openssl
# RUN apt-get -y install openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/zcherrad.42.fr.key -out /etc/nginx/ssl/zcherrad.42.fr.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=zcherrad.42.fr"

# RUN mkdir -p /etc/nginx/ssl/private
# COPY ./tools/script.sh ./tmp/
# RUN chmod +x /tmp/script.sh
# RUN bash /tmp/script.sh
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
