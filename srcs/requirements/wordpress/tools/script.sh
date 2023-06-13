#!/bin/sh
wp core download --allow-root --path=/var/www
sleep 10
cat wp-config-sample.php > wp-config.php
chown -R nobody:nobody /var/www/
chmod -R +rwx /var/www/
echo "extension=tokenizer" >  /etc/php81/php.ini
wp config set --path=/var/www --allow-root DB_NAME $MYSQL_DATABASE
wp config set --path=/var/www --allow-root DB_USER $MYSQL_USER
wp config set --path=/var/www --allow-root DB_PASSWORD $MYSQL_PASSWORD
wp config set --path=/var/www --allow-root DB_HOST $DB_HOST
wp core install --path=/var/www \
--url=$WP_URL \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN_USER \
--admin_password=$WP_ADMIN_PASS \
--admin_email=hh@gmail.com \
--allow-root

# # # Configure WordPress
# wp config set --allow-root WP_CACHE_KEY_SALT 'zcherrad.42.fr'
wp config set --allow-root WP_CACHE 'true' 
wp config set --allow-root WP_REDIS_HOST 'redis'
wp config set --allow-root WP_REDIS_PORT '6379'

# # # Install necessary plugins
wp plugin install --allow-root redis-cache --activate 
wp redis enable --allow-root


# # # Create a user
wp user create $WP_USER $WP_USER_EMAIL  \
    --role=$WP_ROLE \
    --user_pass=$WP_PASS \
    --allow-root

echo "<!DOCTYPE html>
<html>
<head>
  <title>Example HTML File</title>
</head>
<body>
  <h1>Welcome to My Web Page</h1>
  <p>This is a paragraph of text.</p>
</body>
</html>
" > /var/www/index.html
chmod 777 /var/www/index.html

/usr/sbin/php-fpm81 -F 