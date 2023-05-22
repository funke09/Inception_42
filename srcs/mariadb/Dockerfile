FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client

# RUN service mysql start

CMD ["mariadb", "-g", "daemon off;"]

