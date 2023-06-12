#!/bin/sh
# mysql_install_db --user=root --datadir=/var/lib/mysql

# /etc/init.d/mariadb setup

# rc-service mariadb start
# rc-service mariadb stop
# rc-service mariadb start
# if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
# then
# mysql -u root -e "DROP DATABASE IF EXISTS test;"
# mysql -u root -e "DROP USER ''@'localhost';"
# mysql -u root -e "DROP USER ''@'$(hostname)';"
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root -e "GRANT ALL ON *.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"
# mysql -u root -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;"
# mysql -u root -e "FLUSH PRIVILEGES;"
# fi
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"







# mysql -u root -e "CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';"



# rc-service mariadb stop
# exec mysqld --user=root
#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql

rc-service mariadb start

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	mysql -u root -e "DROP DATABASE IF EXISTS test;"
	mysql -u root -e "DROP USER ''@'localhost';"
	mysql -u root -e "DROP USER ''@'$(hostname)';"
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -u root -e "FLUSH PRIVILEGES;"
fi

rc-service mariadb stop

exec mysqld --user=mysql