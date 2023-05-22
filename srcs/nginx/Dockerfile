

FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl


CMD ["nginx", "-g", "daemon off;"]